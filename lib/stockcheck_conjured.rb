require 'stockcheck.rb'
class StockcheckConjured < Stockcheck

  def update_sell_in(item)
    item.sell_in -= 2

  end

  def update_quality(item)
    sell_by_today(item) ? item.quality -= 4 : item.quality -= 2 unless item.quality == 0

  end
end
