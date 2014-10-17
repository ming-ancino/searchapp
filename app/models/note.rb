class Note
  require 'elasticsearch/persistence'

  attr_reader :attributes

  def initialize(attributes={})
    @attributes = attributes
  end

  def to_hash
    @attributes
  end
end
