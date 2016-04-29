require 'gilded_rose'
require 'spec_helper'
require 'item'

describe GildedRose do

  describe "#update_quality" do

    MAXIMUM_QUALITY = 50

    before(:each) do
      @apples = Item.new("Apples", 18, 20)
      @aged_brie =Item.new("Aged Brie", 10,  49)
      @sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
      @ticket = Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 10)
      @shop = GildedRose.new([@apples, @aged_brie, @sulfuras, @ticket])
    end

    it "decreases quality of items" do
      @shop.update_item_status
      expect(@apples.quality).to eq 19
    end

    it "decreases the sell in date" do
      @shop.update_item_status
      expect(@apples.sell_in).to eq 17
    end

    it "doesn't increase quality over #{MAXIMUM_QUALITY}" do
      @shop.update_item_status
      expect{@shop.update_item_status}.to change{ @aged_brie.quality }.by 0
    end

    it "increases the quality of aged goods" do
      expect{@shop.update_item_status}.to change{ @aged_brie.quality }.by 1
    end

    it "doesn't reduces the sell in date of sulfuras" do
      expect{@shop.update_item_status}.to change{ @sulfuras.sell_in }.by 0
    end

    it "doesn't decrease sulfuras quality" do
      @shop.update_item_status
      expect{ @shop }.to change{ @sulfuras.quality }.by 0
    end
end

  describe "tickets" do
    before(:each) do
      @ticket = Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 10)
      @shop = GildedRose.new([@ticket])
    end

    it "increases the value of tickets by 1" do
      expect{@shop.update_item_status}.to change{ @ticket.quality }.by 1
    end

    it "increases the value of tickets by 2 when due in 11 days" do
      2.times{ @shop.update_item_status }
      expect{ @shop.update_item_status }.to change{ @ticket.quality }.by 2
    end

    it "increases the value of tickets by 3 when due in 6 days" do
      7.times{ @shop.update_item_status }
      expect{ @shop.update_item_status }.to change{ @ticket.quality }.by 3
    end
  end

  describe "passed sell-in date" do

    before(:each) do
      @ticket = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)
      @pears = Item.new("Pears", 0, 30)

      @shop = GildedRose.new([@ticket, @pears])
      @shop.update_item_status
    end

      it "decreases quality twice as fast after the due date" do
        expect(@pears.quality).to eq 28
      end

      it "changes the ticket quality to 0 immedietly after the due date" do
        expect(@ticket.quality).to eq 0
      end
  end
end
