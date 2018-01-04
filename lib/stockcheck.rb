class Stockcheck
  def initialize
  end

  def stock_check(items)
    update_sell_in
    update_quality
  end

  def update_sell_in(item)
      item.sell_in -= 1
  end

  def sell_by_today(item)
    item.sell_in == 0
  end

  def update_quality(item)
    sell_by_today(item) ? item.quality -= 2 : item.quality -= 1 unless item.quality == 0
  end
end
