class Serializer
  def initialize(klass)
    @klass = klass
  end

  def serialize
    attributes = @klass.attribute_names
    hash = {}
    attributes.each do |attribute|
      hash[attribute.to_sym] = obj[attribute]
    end
    hash
  end
end
