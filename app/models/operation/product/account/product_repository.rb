class Operations::Account::ProductRepository < Base

    def self.build(attrs)
      obj = entity.new
      obj.account_id = attrs["account_id"]
      obj.return_id = attrs["return_id"] 
      obj.book_id = attrs["book_id"] 
      obj.legal_id = attrs["legal_id"] 
      obj.billing_id = attrs["billing_id"] 
      obj.receivement_id = attrs["receivement_id"]   

      return obj
    end
  
    def self.all_active
      entity.where(active: true)
    end
  
    def self.list_all(products)
      mapper.map_all(products)
    end
  
    def self.read(product)
      mapper.map(product)
    end
  
    def self.find_by_id(id)
      entity.find_by(id: id)
    end
  
    private
  
    def self.entity
      "Operation::Account::Product".constantize
    end
  
    def self.mapper
      "Operations::Accounts::ProductMapper".constantize
    end
  
  end
    
  