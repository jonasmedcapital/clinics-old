
class Operations::Products::DateRepository < Base

    def self.build(attrs)
      obj = entity.new
      obj.open = attrs["open"]
      obj.product_id = attrs["product_id"] 
      obj.month = attrs["month"] 
      obj.year = attrs["year"] 
      obj.uniq_product_date = attrs["uniq_product_date"]       

      return obj
    end
  
    def self.all_active
      entity.where(active: true)
    end
  
    def self.list_all(dates)
      mapper.map_all(dates)
    end
  
    def self.read(date)
      mapper.map(date)
    end
  
    def self.find_by_id(id)
      entity.find_by(id: id)
    end
  
    private
  
    def self.entity
      "Operation::Product::Date".constantize
    end
  
    def self.mapper
      "Operations::Products::DateMapper".constantize
    end
  
  end
    
  