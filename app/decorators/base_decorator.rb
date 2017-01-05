class BaseDecorator < SimpleDelegator

  attr_reader :model

  def initialize(model)
    @model = model
    super(model)
  end

  def self.wrap_all(collection)
    collection.map { |element| new(element) }
  end

  def ==(other)
    @model == other
  end

  def decorated?
    true
  end

end
