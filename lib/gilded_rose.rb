class GildedRose

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_item_status
    @items.each do |item|
      item.update_quality
    end
  end
end

