require 'item'

class AgedGoodsItem < Item

  def update_quality
    reduce_sell_in_time && increase_quality
  end
end
