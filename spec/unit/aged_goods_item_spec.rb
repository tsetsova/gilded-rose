require 'spec_helper'
require 'aged_goods_item'

describe AgedGoodsItem do
  subject(:brie) {described_class.new("Aged Brie", 10,  49)}

  it "#update_item_status keeps the quality as 80" do
    expect{brie.update_item_status}.to change{brie.quality}.by 1
  end

  it "doesn't increase quality over #{@max_quality}" do
      @max_quality = AgedGoodsItem::MAXIMUM_QUALITY
      5.times{brie.update_item_status}
      expect(brie.quality).to eq @max_quality
    end

  it "reduces the sell in time" do
    expect{brie.update_item_status}.to change{brie.sell_in}.by -1
  end
end