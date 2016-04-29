class GildedRose

  attr_reader :items

  LEGENDARY = ["Sulfuras, Hand of Ragnaros"]
  AGED = ["Aged Brie"]
  TICKET = ["Backstage passes to a TAFKAL80ETC concert"]

  def initialize(items)
    @items = items
  end

  def update_quality(item)
   return item.update_ticket_quality if ticket?(item.name)
   return item.decrease_quality if regular_goods?(item.name)
   item.increase_quality if !legendary?(item.name)
  end

  def update_item_status
    @items.each do |item|
      item.reduce_sell_in_time if !legendary?(item.name)
      update_quality(item)
    end
  end

  private

  def legendary?(item_name)
    LEGENDARY.include?(item_name)
  end

  def aged?(item_name)
    AGED.include?(item_name)
  end

  def ticket?(item_name)
    TICKET.include?(item_name)
  end

  def regular_goods?(item_name)
    !legendary?(item_name) && !aged?(item_name) && !ticket?(item_name)
  end
end

