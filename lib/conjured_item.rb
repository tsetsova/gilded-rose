require "item"

class ConjuredItem < Item

  def update_item_status
    reduce_sell_in_time
    2.times{ decrease_quality }
  end
end
