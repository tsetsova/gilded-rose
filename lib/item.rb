class Item
  attr_accessor :name, :sell_in, :quality

  MAXIMUM_QUALITY = 50

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def update_quality
    regular_goods?(@name) ? decrease_quality : increase_quality
    decrease_quality if regular_goods?(@name) && @sell_in < 0
  end

  def increase_quality
    @quality += 1 if @quality < MAXIMUM_QUALITY
  end

  def decrease_quality
    @sell_in > 0 ? @quality -= 1 : @quality -= 2
  end

  def update_ticket_quality
    return @quality = 0 if @sell_in < 0
    return 3.times{ increase_quality } if @sell_in <= 5
    return 2.times{ increase_quality } if @sell_in <= 10
    increase_quality
  end
end