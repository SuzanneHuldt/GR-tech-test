require './lib/stockcheck_sulfuras.rb'
require './lib/item.rb'

describe StockcheckSulfuras do

  let(:item) {Item.new('Sulfuras, Hand of Ragnaro', 5, 5)}

  describe '#update sell in' do
    it 'makes no change' do
      expect {subject.update_sell_in(item)}.to change {item.sell_in}.by(0)
    end
  end

  describe '#update quality' do
    it 'makes no change' do
      expect {subject.update_quality(item)}.to change {item.quality}.by(0)
    end
  end

  describe '#stockcheck' do
    it 'makes no change' do
      expect {subject.stock_check(item)}.to change {item.quality}.by(0)
    end
    it 'makes no change' do
      expect {subject.stock_check(item)}.to change {item.sell_in}.by(0)
    end
  end
end
