class LegendaryItem

  attr_accessor :name, :quality

  def initialize(name)
    @name = name
    @quality = 80
  end

  def update_quality
    @quality
  end
end
