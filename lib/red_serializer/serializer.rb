class Serializer
  def initialize(object)
    @object = object
  end

  def serialize
    attributes = @object.attribute_names
    hash = {}
    attributes.each do |attribute|
      hash[attribute.to_sym] = obj[attribute]
    end
    hash
  end
end
