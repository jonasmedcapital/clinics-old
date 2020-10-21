class Users::Accounts::PhoneRepository < Base
      
  def self.build(account_id)
    obj = entity.new
    obj.owner_id = attrs["owner_id"]
    obj.owner_type = attrs["owner_type"]    
    obj.ddd = attrs["ddd"]    
    obj.number = attrs["number"]    
    obj.uniq_number = attrs["uniq_number"]    
    obj.kind = attrs["kind"]    
    obj.is_main = attrs["is_main"]    
    obj.notes = attrs["notes"]    

    return obj
  end

  def self.find_by_id(id)
    entity.find_by(id: id)
  end

  def self.find_by_uniq_number(uniq_number)
    entity.where(uniq_number: uniq_number).first
  end

  def self.find_by_any_number(number)
    entity.where("number LIKE ?", "%#{number}%").first
  end
  
  def self.all_active_by_account(account_id)
    account = ::Users::Accounts::EntityRepository.find_by_id(account_id)
    phones = account.phones.where(active: true)
  end

  def self.list_all_with_permissions(phones, current_user)
    mapper.map_all_with_permissions(phones, current_user)
  end

  def self.list_all(phones)
    mapper.map_all_active(phones)
  end
  
  def self.read(phone)
    mapper.map(phone)
  end

  def self.read_with_permissions(phone, current_user)
    mapper.map_with_permissions(phone, current_user)
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
    "User::Contact::Phone".constantize
  end

  def self.mapper
    "Users::Accounts::PhoneMapper".constantize
  end

  ENUM_KIND = {
                "personal" => "Pessoal",
                "commercial" => "Comercial"
              }

end