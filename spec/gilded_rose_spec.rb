require 'gilded_rose'
require 'spec_helper'
require 'item'

describe GildedRose do

  describe "#update_quality" do

    before(:each) do
      @pears = Item.new("Pears", 20, 50)
      @apples = Item.new("Apples", 18, 60)
      @brie = Item.new("Aged Brie", 10, 100)
      @sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 10, 80)
      @shop = GildedRose.new([@pears, @apples, @brie, @sulfuras])
    end

    it "decreases quality of items" do
      @shop.update_quality
      expect(@pears.quality).to eq 49
      expect(@apples.quality).to eq 59
    end

    it "doesn't decrease brie quality" do
      expect{@shop.update_quality}.to change{@brie.quality}.by 0
    end

    it "doesn't decrease sulfuras quality" do
      expect{@shop.update_quality}.to change{@sulfuras.quality}.by 0
    end

    it "reduces the sell in date" do
      @shop.update_quality
      expect(@pears.sell_in).to eq 19
      expect(@apples.sell_in).to eq 17
    end

    it "doesn't reduces the sell in date of sulfuras" do
      expect{@shop.update_quality}.to change{@sulfuras.sell_in}.by 0
    end
  end

end
