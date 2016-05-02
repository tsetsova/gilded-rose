require 'spec_helper'
require 'item'

describe Item do
  subject(:apples) { described_class.new("Apples", 18,  20) }

  it "#update_item_status reduces quality" do
    expect{ apples.update_item_status }.to change{ apples.quality }.by -1
  end

  it "reduces the sell in time" do
    expect{ apples.update_item_status }.to change{ apples.sell_in }.by -1
  end


  it "decreases quality twice as fast after the due date" do
    pears = Item.new("Pears", 0, 30)
    expect{ pears.update_item_status }.to change{ pears.quality }.by -2
  end
end