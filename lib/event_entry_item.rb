class EventEntryItem < Item

  def update_item_status
    return zero_quality if @sell_in < 0
    reduce_sell_in_time
    increment_quality
  end

private

  def zero_quality
    @quality = 0
  end

  def increment_quality
    (11.0/@sell_in).ceil.times { increase_quality }
  end
end