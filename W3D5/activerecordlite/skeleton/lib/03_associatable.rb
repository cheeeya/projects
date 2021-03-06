require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    @class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    @foreign_key = "#{name}Id".underscore.to_sym
    @primary_key = :id
    @class_name = name.to_s.camelcase
    options.each_key do |key|
      instance_variable_set("@#{key}", options[key])
    end
  end
end


class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    @foreign_key = "#{self_class_name}Id".underscore.to_sym
    @primary_key = :id
    @class_name = name.to_s.singularize.camelcase
    options.each_key do |key|
      instance_variable_set("@#{key}", options[key])
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    define_method(name.to_s.underscore.to_sym) do
      foreign_key = options.send(:foreign_key)
      foreign_key_value = self.attributes[foreign_key]
      options.model_class.where(options.primary_key => foreign_key_value).first
    end
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
  # Mixin Associatable here...
end
