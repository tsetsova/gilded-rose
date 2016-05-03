require 'gilded_rose'
require 'event_entry_item'
require 'legendary_item'
require 'aged_goods_item'
require 'item'
require 'spec_helper'

describe GildedRose do

  let(:pass) { EventEntryItem.new("Pass", 10, 9) }
  let(:cookies) { Item.new("Cookies", 20, 10) }
  let(:sword) { LegendaryItem.new("Sword") }
  let(:wand) { ConjuredItem.new("Magic Wand", 30, 40) }
  let(:camambert) { AgedGoodsItem.new("Camambert", 5, 10) }
  let(:items) { [pass, cookies, sword, camambert, wand] }

  subject(:shop) { described_class.new(items) }

  it "update items sell in" do
    shop.update_item_status
    expect(pass.sell_in).to eq 9
    expect(cookies.sell_in).to eq 19
    expect(wand.sell_in).to eq 29
    expect(camambert.sell_in).to eq 4
  end

  it "update items quality" do
    shop.update_item_status
    expect(pass.quality).to eq 11
    expect(cookies.quality).to eq 9
    expect(sword.quality).to eq 80
    expect(wand.quality).to eq 38
    expect(camambert.quality).to eq 11
  end
end
