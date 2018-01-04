require 'stockcheck.rb'

class StockcheckBackstage < Stockcheck

  def update_quality(item)
    case item.sell_in
    when 0
      item.quality = 0
    when >= 11
      item.quality += 1
    when 5> <11
      item.quality += 2
    when 0> <5
      item.quality += 3
  end


end
