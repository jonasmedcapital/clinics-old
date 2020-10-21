class Users::Accounts::AddressRepository < Base
      
  def self.build(attrs)
    obj = entity.new
    obj.owner_id = attrs["owner_id"]
    obj.owner_type = attrs["owner_type"]    
    obj.account_id = attrs["account_id"]    
    obj.postal_code = attrs["postal_code"]    
    obj.street = attrs["street"]    
    obj.number = attrs["number"]    
    obj.complement = attrs["complement"]    
    obj.district = attrs["district"]       
    obj.city = attrs["city"]       
    obj.state = attrs["state"]       
    obj.country = attrs["country"]       
    obj.ibge = attrs["ibge"]       
    obj.kind = attrs["kind"]       
    obj.is_main = attrs["is_main"]       
    obj.notes = attrs["notes"]       
    
    return obj
  end

  def self.find_by_id(id)
    entity.find_by(id: id)
  end

  def self.find_by_address(address)
    entity.where(address: address).first
  end

  def self.find_by_any_address(address)
    entity.where("address LIKE ?", "%#{address}%").first
  end

  def self.all_active_by_account(account_id)
    account = ::Users::Accounts::EntityRepository.find_by_id(account_id)
    addresses = account.addresses.where(active: true)
  end
  
  def self.list_all_with_permissions(addresses, current_user)
    mapper.map_all_with_permissions(addresses, current_user)
  end

  def self.list_all(addresses)
    mapper.map_all_active(addresses)
  end

  def self.read(address)
    mapper.map(address)
  end

  def self.read_with_permissions(address, current_user)
    mapper.map_with_permissions(address, current_user)
  end 

  def count
    all.count
  end

  def first
    all.first
  end

  def second
    all.second
  end
  
  def last
    all.last
  end

  private

  def self.entity
    "User::Contact::Address".constantize
  end

  def self.mapper
    "Users::Accounts::AddressMapper".constantize
  end

  ENUM_KIND = {
                "personal" => "Pessoal",
                "commercial" => "Comercial"
              }
      
end