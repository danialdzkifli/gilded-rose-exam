require_relative 'item'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.quality <= 50 && item.quality >= 0
        if item.sell_in > 0  
          case item.name
          when "Aged Brie"
            item.quality = item.quality + 1
          when "Sulfuras, Hand of Ragnaros"
            item.sell_in = nil
            item.quality = 80
          when "Backstage passes to a TAFKAL80ETC concert"
            case item.sell_in
            when 6 .. 10
              item.quality = item.quality + 2
            when 1 .. 5 
              item.quality = item.quality + 3
            when 0
              item.quality = 0
            else 
              item.quality = item.quality + 1
            end
          when "Conjured"
            item.quality = item.quality - 2
          else
            item.quality = item.quality - 1
          end
        else
          if item.name == "Conjured"
            item.quality = item.quality - 4
          else
            item.quality = item.quality - 2
          end
        end 
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
    end
  end
end

normal = Item.new("Normal", 5, 10)
aged_brie = Item.new("Aged Brie", 5, 10)
conjured = Item.new("Conjured", 10, 10)
backstage_pass = Item.new("Backstage passes to a TAFKAL80ETC concert", 2, 10)
sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
item = [normal,aged_brie, conjured, backstage_pass, sulfuras]
output = GildedRose.new(item)
puts output.update_quality