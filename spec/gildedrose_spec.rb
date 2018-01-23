require './lib/gilded_rose.rb'
require './lib/item.rb'

describe GildedRose do

  let(:items) {[Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 5),
     Item.new('Aged Brie', 5, 3), Item.new('Sulfuras, Hand of Ragnaro', 5, 5), Item.new('Conjured', 5, 5), Item.new('duck', 5, 5)]
   }

  let(:gilded_rose) {GildedRose.new(items)}

  describe '#filter' do
    xit '#filters brie into brie array' do
      expect {gilded_rose.filter(items)}.to change {gilded_rose.brie.length}.by(1)
    end
    xit '#filters conjured items into conjured array' do
      expect {gilded_rose.filter(items)}.to change {gilded_rose.conjured.length}.by(1)
    end
    xit '#filters sulfuras into the sulfuras array' do
      expect {gilded_rose.filter(items)}.to change {gilded_rose.sulfaras.length}.by(1)
    end
    xit '#filters passes into the passes array' do
      expect {gilded_rose.filter(items)}.to change {gilded_rose.passes.length}.by(1)
    end
  end
end
