#!/usr/bin/ruby -w

class House
  attr_reader :formatter, :data

  def initialize orderer: DefaultOrder.new, formatter: DefaultFormatter.new
    @formatter = formatter
    @data = orderer.order(DATA)
  end

  # ...
end

class DefaultOrder
  def order data
    data
  end
end

class RandomOrder
  def order data
    data.shuffle
  end
end

class DefaultFormatter
  def format parts
    parts
  end
end

class EchoFormatter
  def format parts
    parts.zip(parts).flatten
  end
end

# puts House.new.recite
# puts House.new(orderer: RandomOrder.new).recite
# puts House.new(formatter: EchoFormatter.new).recite
# puts House.new(orderer: RandomOrder.new,
#                formatter: EchoFormatter.new).recite
