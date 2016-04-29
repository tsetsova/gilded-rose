require 'gilded_rose'
require 'spec_helper'
require 'item'

describe GildedRose do

  describe "#update_quality" do

    before(:each) do
      @pears = Item.new("Pears", 20, 50)
      @apples = Item.new("Apples", 18, 60)
      @brie = Item.new("Aged Brie", 10, 100)
      @shop = GildedRose.new([@pears, @apples, @brie])
    end

    it "decreases quality of items" do
      @shop.update_quality
      expect(@pears.quality).to eq 49
      expect(@apples.quality).to eq 59
    end

    it "doesn't decrase brie quality" do
      expect{@shop.update_quality}.to change{@brie.quality}.by 0
    end

  end

end
