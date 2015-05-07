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

class RandomHouse < House
  def initialize
    super orderer: RandomOrder.new
  end
end

class EchoHouse < House
  def initialize
    super formatter: EchoFormatter.new
  end
end

class RandomEchoHouse < House
  def initialize
    super orderer: RandomOrder.new, formatter: EchoFormatter.new
  end
end

# puts House.new.recite
# puts RandamHouse.new.recite
# puts EchoHouse.new.recite
# puts RandomEchoHouse.new.recite
