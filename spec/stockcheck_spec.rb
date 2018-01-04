#require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'stockcheck.rb'
require 'item.rb'

describe Stockcheck do

  describe "#update_quality" do
    xit "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end
  end

  describe '#update sell-in value' do
    it 'decreases sell-in value by 1' do
      item = Item.new('test', 5, 5)
      expect {subject.update_sell_in(item)}.to change {item.sell_in}.by(-1)
    end
  end

  describe '#sell by today' do
    it 'returns true if the sell-in value is zero' do
      item = Item.new('test', 0, 0)
      expect(subject.sell_by_today(item)).to be(true)
    end
  end

  describe '#update quality value (decrease) - before sell-by' do
    it 'decreases the quality of items by 1' do
      item = Item.new('test', 5, 5)
      expect {subject.update_quality(item)}.to change {item.quality}.by(-1)
    end
    it 'does not allow the quality value to fall below 0' do
      item = Item.new('test', 0, 0)
      expect {subject.update_quality(item)}.to change {item.quality}.by(0)
    end
    it 'decreases the quality of conjured items by 2' do
      item = Item.new('Conjured', 5, 5)
      expect {subject.update_quality(item)}.to change {item.quality}.by(-2)
    end
  end

  describe '#update quality value (decrease) - after sell-by' do
    it 'decreases the quality of typical items by 2' do
      item = Item.new('test', 0, 5)
      expect {subject.update_quality(item)}.to change {item.quality}.by(-2)
    end
    it 'decreases the quality of conjured items by 4' do
      item = Item.new('Conjured', 0, 5)
      expect expect {subject.update_quality(item)}.to change {item.quality}.by(-4)
    end
  end

  describe '#update quality value (increase)' do
    it 'raises the value of brie by 1' do
      item = Item.new('Aged Brie', 5, 5)
      expect {subject.update_quality(item)}.to change {item.quality}.by(1)
    end
  end

  describe '#update quality value (increase) backstage pass condition' do
    it 'increases the quality by 2 with <= 10 days until concert' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 5)
      expect {subject.update_quality(item)}.to change {item.quality}.by(2)
    end
    it 'increases the quality by 3 with <= 5 days until concert' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 5)
      expect {subject.update_quality(item)}.to change {item.quality}.by(3)

    end
    it 'sets quality to zero when concert has passed' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 5)
      expect(item.quality).to eq(0)
    end
  end

  describe '#maximum value' do
    it 'does not allow the value of any item to exceed 50' do
      item = Item.new('Aged Brie', 3, 50)
      expect {subject.update_quality(item)}.to change {item.quality}.by(0)
    end
  end

  describe '#sulfuras conditions' do
    it 'does not alter the quality value' do
      item = Item.new('Sulfuras, Hand of Ragnaro', 3, 50)
      expect {subject.update_quality(item)}.to change {item.quality}.by(0)

    end
    it 'does not alter the sell in value' do
      item = Item.new('Sulfuras, Hand of Ragnaro', 3, 50)
      expect {subject.update_sell_in(item)}.to change {item.sell_in}.by(0)
    end
  end

  shared_examples "stockcheck" do
    let(:stockcheck) {Stockcheck.new}
    context 'it decreases the sell_in by 1' do
      xit 'returns a sell_in value lowered by 1' do

      end
    end
  end
end
