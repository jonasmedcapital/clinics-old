class Users::Accounts::EmailRepository < Base
      
  def self.build(account_id)
    obj = entity.new
    obj.owner_id = attrs["owner_id"]
    obj.owner_type = attrs["owner_type"]    
    obj.address = attrs["ddd"]    
    obj.kind = attrs["number"]    
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
    emails = account.emails.where(active: true)
  end
  
  def self.list_all_with_permissions(emails, current_user)
    mapper.map_all_with_permissions(emails, current_user)
  end

  def self.list_all(emails)
    mapper.map_all_active(emails)
  end

  def self.read(email)
    mapper.map(email)
  end

  def self.read_with_permissions(email, current_user)
    mapper.map_with_permissions(email, current_user)
  end 

  def self.all_active_count(account)
    account.emails.where(active: true).count
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
    "User::Contact::Email".constantize
  end

  def self.mapper
    "Users::Accounts::EmailMapper".constantize
  end

  ENUM_KIND = {
                "personal" => "Pessoal",
                "commercial" => "Comercial"
              }

end