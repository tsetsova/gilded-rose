class Item
  attr_accessor :name, :sell_in, :quality

  MAXIMUM_QUALITY = 50

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality(item)
    item.update_quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def reduce_sell_in_time
    @sell_in -= 1
  end

  def increase_quality
    @quality += 1 if @quality < MAXIMUM_QUALITY
  end

  def decrease_quality
    @sell_in > 0 ? @quality -= 1 : @quality -= 2
  end
end

class EventRelatedItem < Item

  def update_quality
    return zero_quality if @sell_in < 0
    increment_quality
  end

private

  def zero_quality
    @quality = 0
  end

  def increment_quality
    (11.0/@sell_in).ceil.times { increase_quality}
  end

end
