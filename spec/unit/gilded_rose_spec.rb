require 'gilded_rose'
require 'item'

describe GildedRose do

  let(:item_1){double(:item_1, update_item_status: nil) }
  let(:item_2){double(:item_2, update_item_status: nil)}

  subject(:shop) { GildedRose.new([item_1, item_2]) }

  it "calls update item status on items" do
    shop.update_item_status
    expect(item_1).to have_received(:update_item_status)
    expect(item_2).to have_received(:update_item_status)
  end
end
