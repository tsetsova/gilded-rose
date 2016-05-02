require 'spec_helper'
require 'event_entry_item'

describe EventEntryItem do
  subject(:pass) { described_class.new("Backstage passes to a TAFKAL80ETC concert", 12, 10)}

    it "increases the value of a pass by 1" do
      expect{pass.update_item_status}.to change{ pass.quality }.by 1
    end

    it "increases the value of a pass by 2 when even is in 11 days" do
      pass.update_item_status
      expect{ pass.update_item_status }.to change{ pass.quality }.by 2
    end

    it "increases the value of pass by 3 when event is in 6 days" do
      6.times{ pass.update_item_status }
      expect{ pass.update_item_status }.to change{ pass.quality }.by 3
    end

    it "changes the pass quality to 0 immedietly after the event is over" do
      12.times{ pass.update_item_status }
      expect(pass.quality).to eq 0
    end
end