require 'item'

class AgedGoodsItem < Item

  def update_item_status
    reduce_sell_in_time
    increase_quality
  end
end
