require 'stockcheck.rb'

class StockcheckBackstage < Stockcheck

  def update_quality(item)
    quality_reset(item) if sell_by_today(item)
    item.quality += 2 if ten_days(item)
    item.quality += 3 if five_days(item)
    item.quality += 1 if unexceptional(item)
  end

  def ten_days(item)
    5 < item.sell_in && item.sell_in <=10
  end

  def five_days(item)
    0 < item.sell_in && item.sell_in <= 5
  end

  def unexceptional(item)
    item.sell_in > 10
  end

  def quality_reset(item)
    item.quality = 0
  end

end
