require 'stockcheck.rb'

class StockcheckBrie < Stockcheck

  def update_quality(item)
    item.quality += 1
  end


end
