require 'spec_helper'
require 'legendary_item'

describe LegendaryItem do
  subject(:sulfuras) { described_class.new("Sulfuras, Hand of Ragnaros") }

  it "#update_quality keeps the quality as 80" do
    expect(sulfuras.update_quality).to eq 80
  end
end