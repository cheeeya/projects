require 'byebug'
class ModelBase

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{tableize}
      WHERE
        #{tableize}.id = ?
    SQL
    return nil if data.empty?
    self.new(data.first)
  end

  def self.tableize
    "#{self.to_s.downcase}s"
  end

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{tableize}
    SQL
    return nil if data.empty?
    data.map { |datum| self.new(datum) }
  end

  def self.where(options)
    string = ""
    options.each_key do |key|
      if key == options.keys.last
        string += "#{key} = ?"
      else
        string += "#{key} = ? AND "
      end
    end
    array = []
    options.each_value do |val|
      array << val
    end
    data = QuestionsDatabase.instance.execute(<<-SQL, *array)
      SELECT
        *
      FROM
        #{tableize}
      WHERE
        #{string}
    SQL
    return nil if data.empty?
    data.map { |datum| self.new(datum) }
  end

  def self.method_missing(*args)
    method_name = args.shift.to_s
    if method_name.start_with?("find_by_")
      search_param = method_name[("find_by_").length..-1].split("_and_")
      search_string = ""
      search_param.each do |param|
        if param == search_param.last
          search_string += "#{param} = ?"
        else
          search_string += "#{param} = ? AND "
        end
      end
      p search_string
      data = QuestionsDatabase.instance.execute(<<-SQL, *args)
        SELECT
          *
        FROM
          #{tableize}
        WHERE
          #{search_string}
      SQL
      return nil if data.empty?
      data.map { |datum| self.new(datum) }
    else
      raise "Not a find_by_ Method"
    end
  end
end
