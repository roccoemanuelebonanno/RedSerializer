class Serializer
  def initialize(object)
    @object = object
  end

  def serialize
    active_record_object? ? serialize_active_record_obj : serialize_poro_obj
  end

  private

  def active_record_object?
    @object.class.ancestors.map(&:to_s).include? "ActiveRecord::Base"
  end

  def serialize_active_record_obj
    hash = {}
    @object.attribute_names.each do |attribute|
      hash[attribute.to_s] = @object[attribute]
    end
    hash
  end

  def serialize_poro_obj
    attributes = @object.instance_variables.map { |iv| iv.to_s.sub(/^@/, "") }
    hash = {}
    attributes.each do |attribute|
      hash[attribute.to_s] = @object.instance_variable_get "@#{attribute}"
    end
    hash
  end
end
