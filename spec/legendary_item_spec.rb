require 'spec_helper'
require 'legendary_item'

describe LegendaryItem do
  subject(:sulfuras) { described_class.new("Sulfuras, Hand of Ragnaros") }

  it "#update_item_status keeps the quality as 80" do
    expect(sulfuras.update_item_status).to eq 80
  end
end