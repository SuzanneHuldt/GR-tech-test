class StockcheckBrie


  def update_sell_in(item)
      item.sell_in -= 1
  end

  def sell_by_today(item)
  
  end

  def update_quality(item)
    item.quality += 1
  end


end
