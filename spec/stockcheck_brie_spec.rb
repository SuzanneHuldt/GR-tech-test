require './lib/stockcheck_brie.rb'
require './lib/item.rb'

describe StockcheckBrie do
  let(:item) {Item.new('Aged Brie', 5, 5)}

  describe '#update sell in' do
    it 'reduces sell in by 1' do
      expect {subject.update_sell_in(item)}.to change {item.sell_in}.by(-1)
    end
  end

  describe '#update quality' do
    it 'increases quality by 1' do
      expect {subject.update_quality(item)}.to change {item.quality}.by(1)
    end
  end

  describe '#stockcheck' do
    it 'increase quality by 1' do
      expect {subject.stock_check(item)}.to change {item.quality}.by(1)
    end
    it 'decrease sell in by 1' do
      expect {subject.stock_check(item)}.to change {item.sell_in}.by(-1)
    end
  end
end
