require 'spec_helper'
require 'conjured_item'

describe ConjuredItem do
  subject(:wand) {described_class.new("Magic Wand", 20,  30)}

  it "decreases quality by 2" do
    expect{wand.update_item_status}.to change{wand.quality}.by -2
  end

  it "reduces the sell in time" do
    expect{wand.update_item_status}.to change{wand.sell_in}.by -1
  end
end