class Operation::Product::Entity < ApplicationRecord

  self.table_name = "product_entities"
  # default_scope -> {order(updated_at: :desc)}

  attr_accessor :kind_pretty, :product_name, :product_path, :token
  
  # Relations
  belongs_to :account, class_name: "User::Account::Entity", foreign_key: "account_id", optional: true
  belongs_to :company, class_name: "User::Company::Entity", foreign_key: "company_id", optional: true
  has_many :dates, class_name: "Product::Date", foreign_key: "product_id"

  has_many :transfers, class_name: "Operation::Product::Receivement::Transfer", foreign_key: "receivement_id"

  # Validations
  validates :name, presence: { message: "Favor inserir o nome do Produto. " }
  validates :kind, presence: { message: "Favor inserir o tipo de Produto. " }
  validates :started_at, presence: { message: "Favor inserir o tipo de Produto. " }
  validates :uniq_product, uniqueness: { case_sensitive: false, message: "A Conta Produto já existe. " }

  #Enums
  enum name: { medpj: 0, medpf: 1, medfat: 2, medseg: 3, medfin: 4, medclin: 5 }, _prefix: :_
  enum kind: { receivement: 0, practice: 1, clinic: 2 }, _prefix: :_

  #Callbacks
  before_validation :set_uniq_product
  after_find :set_attr_accessors


  def set_uniq_product
    if self.account_id
      account_code = self.account_id.to_s(36).rjust(4,"0").upcase
    else
      account_code = 0.to_s(36).rjust(4,"0").upcase
    end
    if self.company_id
      company_code = self.company_id.to_s(36).rjust(4,"0").upcase
    else
      company_code = 0.to_s(36).rjust(4,"0").upcase
    end

    name_code = self.defined_enums["name"][self.name]
    kind_code = self.defined_enums["kind"][self.kind]

    self.uniq_product = "#{account_code}#{company_code}#{name_code}#{kind_code}"
    
  end

  def refact_uniq_product
    set_uniq_product
    self.save
  end
  

  def set_attr_accessors
    self.product_name = ::Operations::Products::EntityRepository::ENUM_NAME[self.name]
    self.kind_pretty = ::Operations::Products::EntityRepository::ENUM_KIND[self.kind]
    self.product_path = ::Operations::Products::EntityRepository::PRODUCT_PATH[self.name][self.kind]
    self.token = self.uniq_product
  end
  
end


# create_table "product_entities", force: :cascade do |t|
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.boolean "active", default: true, null: false
# t.boolean "status", default: true, null: false
# t.boolean "blocked", default: false, null: false
# t.bigint "account_id"
# t.bigint "company_id"
# t.integer "name"
# t.integer "kind"
# t.string "uniq_product"
# t.decimal "amount", default: "0.0"
# t.date "started_at"
# t.integer "month_started_at"
# t.integer "year_started_at"
# t.text "notes"