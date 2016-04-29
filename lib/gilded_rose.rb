class GildedRose

  attr_reader :items

  LEGENDARY = ["Sulfuras, Hand of Ragnaros"]
  AGED = ["Aged Brie"]
  PASS = ["Backstage passes to a TAFKAL80ETC concert"]
  MAXIMUM_QUALITY = 50

  def initialize(items)
    @items = items
  end

  def update_quality(item)
    regular_goods?(item.name) ? decrease_quality(item) : increase_quality(item)

    if pass?(item)
      if item.sell_in < 11
        increase_quality(item)
      end

      if item.sell_in < 6
        increase_quality(item)
      end
    end

    if item.sell_in < 0
      return item.quality = 0 if pass?(item.name)
      decrease_quality(item) if regular_goods?(item.name)
    end
  end

  def update_item_status
    @items.each do |item|
      reduce_sell_in_time(item)
      update_quality(item)
    end
  end

  private

  def increase_quality(item)
    item.quality += 1 if item.quality < MAXIMUM_QUALITY
  end

  def decrease_quality(item)
    item.quality -= 1 if item.quality > 0 && !legendary?(item.name)
  end

  def reduce_sell_in_time(item)
    item.sell_in -= 1 if !legendary?(item.name)
  end

  def legendary?(item_name)
    LEGENDARY.include?(item_name)
  end

  def aged?(item_name)
    AGED.include?(item_name)
  end

  def pass?(item_name)
    PASS.include?(item_name)
  end

  def regular_goods?(item_name)
    !legendary?(item_name) && !aged?(item_name) && !pass?(item_name)
  end
end

