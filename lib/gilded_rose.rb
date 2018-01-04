class GildedRose
  attr_accessor :brie, :conjured, :sulfaras, :passes, :typical
  def initialize(items)
    @items = items
    @brie = []
    @conjured = []
    @sulfaras = []
    @passes = []
    @typical = []
  end

  def filter(items)
    @brie = items.select {|item| item.name == 'Aged Brie'}
    @conjured = items.select {|item| item.name == 'Conjured'}
    @sulfaras = items.select {|item| item.name == 'Sulfuras, Hand of Ragnaro'}
    @passes = items.select {|item| item.name == 'Backstage passes to a TAFKAL80ETC concert'}
  end


end
