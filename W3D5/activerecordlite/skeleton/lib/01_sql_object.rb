require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    if @columns.nil?
      @columns = []
      columns_string = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{self.table_name}
      SQL
        .first
      columns_string.each do |column|
        @columns << column.to_sym
      end
    end
    @columns
  end

  def self.finalize!
    self.columns
    @columns.each do |column|
      define_method("#{column}=") do |value|
        self.attributes[column] = value
      end

      define_method(column.to_s) do
        self.attributes[column]
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.pluralize.underscore
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
    self.parse_all(results)
  end

  def self.parse_all(results)
    results.map do |hash|
      self.new(hash)
    end
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        id = ?
    SQL
    return nil if result.empty?
    self.new(result.first)
  end

  def initialize(params = {})
    class_obj = self.class
    params.each do |attr_name, value|
      unless class_obj.columns.include?(attr_name.to_sym)
        raise "unknown attribute '#{attr_name}'"
      end
      self.send("#{attr_name}=", value)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    values = []
    self.class.columns.map.each do |column|
      values << send(column)
    end
    values
  end

  def insert
    col_names = self.class.columns.join(",")
    question_marks = (["?"] * self.class.columns.length).join(",")
    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL
    self.send(:id=, DBConnection.last_insert_row_id)
  end

  def update
    column_set = self.class.columns.map { |column| "#{column} = ?" }.join(" , ")
    c_id = self.send(:id)
    DBConnection.execute(<<-SQL, *attribute_values, c_id)
      UPDATE
        #{self.class.table_name}
      SET
        #{column_set}
      WHERE
        id = ?
    SQL
  end

  def save
    if self.send(:id)
      self.update
    else
      self.insert
    end
  end

end
