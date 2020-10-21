class Users::Accounts::EntityRepository < Base
      
  def self.build(kind)
    token = set_token
    entity.new(kind: [kind], token: token.upcase)
  end

  def self.all_active_by_kind(kind)
    # entity.where(active: true).where("'#{kind}' = ANY (kind)")
    entity.where(active: true).where("? = ANY (kind)", kind)
  end
  
  def self.list_all_with_permissions(collection, current_user, feature)
    mapper.map_all_with_permissions(collection, current_user, feature)
  end

  def self.read_with_permissions(account, current_user, feature)
    mapper.map_with_permissions(account, current_user, feature)
  end

  def self.report_with_permissions(current_user, feature)
    mapper.report_with_permissions(entity, current_user, feature)
  end
  
  def self.read(account)
    mapper.map(account)
  end
  
  def self.read_user_with_permisssion(account, current_user)
    user = account.user
    if user
      mapper.map_user_with_permisssion(user, current_user)
    else
      user_build = Users::UserRepository.build(account)
      mapper.map_user_with_permisssion(user_build, current_user)
    end
  end

  def self.read_products_with_permisssion(account, current_user)
    mapper.map_products_with_permisssion(account, current_user)
  end

  def self.find_by_id(id)
    entity.find_by(id: id)
  end

  def find_by_email(email)
    all.where(email: email).first
  end

  def self.find_by_cpf(cpf)
    entity.where(cpf: cpf).first
  end

  def self.find_by_token(token)
    entity.where(token: token).first
  end

  def find_by_name(name)
    all.where("name LIKE ?", "%#{name}%").first
  end

  def list_all(all)
    ::Users::UserMapper.new.map_all_active(all)
  end

  def read(user)
    ::Users::UserMapper.new.map(user)
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

  def self.update_token(account)
    token = set_token
    account.token = token.upcase
    account.save
    user = account.user
    user.token = token.upcase if user
    user.save if user
  end
  

  private

  def self.set_token
    token = ::Base.generate_token
    set_token if valid_token token
    token
  end

  def self.entity
    "User::Account::Entity".constantize
  end

  def self.mapper
    "Users::Accounts::EntityMapper".constantize
  end
  

  ENUM_SEX = {
            "male" => "Masculino",
            "female" => "Feminino",
          }
end