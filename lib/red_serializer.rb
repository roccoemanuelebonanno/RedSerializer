# frozen_string_literal: true

require_relative "red_serializer/version"
require_relative "red_serializer/serializer"
module RedSerializer
  class << self
    def serialize(object)
      Serializer.new(object).serialize
    end
  end
end
