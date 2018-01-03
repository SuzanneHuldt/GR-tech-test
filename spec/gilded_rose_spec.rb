#require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'gilded_rose.rb'
require 'item.rb'

describe GildedRose do

  describe "#update_quality" do
    xit "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end
  end

  describe '#update quality value (decrease) - before sell-by' do
    it 'decreases the quality of typical items by 1' do

    end
    it 'decreases the quality of conjured items by 2' do

    end
  end

  describe '#update quality value (decrease) - after sell-by' do
    it 'decreases the quality of typical items by 2' do

    end
    it 'decreases the quality of conjured items by 4' do

    end
  end

  describe '#update quality value (increase)' do
    it 'raises the value of brie by 1' do

    end
  end

  describe '#update quality value (increase) backstage pass condition' do
    it 'increases the quality by 2 with <= 10 days until concert' do

    end
    it 'increases the quality by 3 with <= 5 days until concert' do

    end
    it 'sets quality to zero when concert has passed' do

    end
  end

  describe '#maximum value' do
    it 'does not allow the value of any item to exceed 50' do
      
    end
  end

end
