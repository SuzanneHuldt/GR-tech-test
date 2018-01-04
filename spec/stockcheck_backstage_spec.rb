require './lib/stockcheck_backstage.rb'
require './lib/item.rb'
 describe StockcheckBackstage do
   let(:item) {Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 5)}
   let(:nine_days) {Item.new('Backstage passes to a TAFKAL80ETC concert', 9, 5)}
   let(:four_days) {Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 5)}
   let(:zero_days) {Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 5)}


   describe '#update sell in' do
     it 'reduces sell in by 1' do
       expect {subject.update_sell_in(item)}.to change {item.sell_in}.by(-1)
     end
   end

   describe '#update quality' do
     it 'increases quality by 1 when sell in over 10' do
      expect {subject.update_quality(item)}.to change {item.quality}.by(1)
     end
     it 'increases quality by 2 when sell in under 10 but over 5' do
      expect {subject.update_quality(nine_days)}.to change {nine_days.quality}.by(2)
     end
     it 'increases quality by 3 when sell in under 5 but over 0' do
      expect {subject.update_quality(four_days)}.to change {four_days.quality}.by(3)
     end
     it 'sets quality to 0 when sell in at 0' do
       subject.update_quality(zero_days)
      expect(zero_days.quality).to eq(0)
     end
   end

   describe '#ten days' do
     it 'returns true if the pass in the in the ten day quality block' do
       expect(subject.ten_days(nine_days)).to be(true)
     end
   end

   describe '#five days' do
     it 'returns true if the pass in the in the five day quality block' do
       expect(subject.five_days(four_days)).to be(true)
     end
   end

   describe '#sell by today' do
     it 'returns true for zero days item' do
       expect(subject.sell_by_today(zero_days)).to be(true)
     end
   end

   describe '#stockcheck' do
     it 'increase quality by 1' do
       p item
       expect {subject.stock_check(item)}.to change {item.quality}.by(1)
     end
     it 'decrease sell in by 1' do
       expect {subject.stock_check(item)}.to change {item.sell_in}.by(-1)
     end
   end
 end
