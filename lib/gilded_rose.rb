class GildedRose

  attr_reader :items

  LEGENDARY = ["Sulfuras, Hand of Ragnaros"]
  AGED = ["Aged Brie"]
  TICKET = ["Backstage passes to a TAFKAL80ETC concert"]
  MAXIMUM_QUALITY = 50

  def initialize(items)
    @items = items
  end

  def update_quality(item)
   return update_ticket_quality(item) if ticket?(item.name)
    regular_goods?(item.name) ? decrease_quality(item) : increase_quality(item)
    decrease_quality(item) if regular_goods?(item.name) && item.sell_in < 0
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

  def ticket?(item_name)
    TICKET.include?(item_name)
  end

  def update_ticket_quality(item)
    return item.quality = 0 if item.sell_in < 0
    return 3.times{ increase_quality(item) } if item.sell_in <= 5
    return 2.times{ increase_quality(item) } if item.sell_in <= 10
    increase_quality(item)
  end

  def regular_goods?(item_name)
    !legendary?(item_name) && !aged?(item_name) && !ticket?(item_name)
  end
end

