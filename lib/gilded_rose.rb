class GildedRose

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_item_status
    @items.map(&:update_item_status)
  end
end

