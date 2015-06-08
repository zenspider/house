#!/usr/bin/ruby -w

class House
  class Identity
    def self.order data
      data
    end

    def self.format parts
      parts
    end
  end

  attr_reader :formatter, :data

  def initialize orderer: Identity, formatter: Identity
    @formatter = formatter
    @data = orderer.order(DATA)
  end

  # ...
end

class RandomOrder
  def order data
    data.shuffle
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

# puts House.new.recite
# puts RandamHouse.new.recite
# puts EchoHouse.new.recite

# or any other combo:
House.new orderer: RandomOrder.new, formatter: EchoFormatter.new
