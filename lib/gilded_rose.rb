class GildedRose

  attr_reader :items

  LEGENDARY = ["Sulfuras, Hand of Ragnaros"]

  def initialize(items)
    @items = items
  end

  def decrease_quality(item)
    item.quality -= 1 if item.quality > 0
  end

  def decrease_sell_in(item)
    item.sell_in -= 1
  end

  def update_quality
    @items.each do |item|
      decrease_sell_in(item) if !LEGENDARY.include?(item.name)

      if !["Aged Brie", "Backstage passes to a TAFKAL80ETC concert"].include?(item.name) && !LEGENDARY.include?(item.name)
          decrease_quality(item)
      else
        if item.quality < 50
          item.quality = item.quality + 1

          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end

            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end


      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end

