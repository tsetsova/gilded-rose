class GildedRose

  attr_reader :items

  LEGENDARY = ["Sulfuras, Hand of Ragnaros"]

  def initialize(items)
    @items = items
  end

  def update_quality(item)
    item.update_quality
  end

  def update_item_status
    @items.each do |item|
      item.reduce_sell_in_time && update_quality(item) if not legendary?(item.name)
    end
  end

  private

  def legendary?(item_name)
    LEGENDARY.include?(item_name)
  end
end

