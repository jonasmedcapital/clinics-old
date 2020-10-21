class Operations::Products::EntityRepository < Base

  def self.build(attrs)
    obj = entity.new    
    obj.account_id = attrs["account_id"]
    obj.name = attrs["name"] 
    obj.kind = attrs["kind"] 
    obj.uniq_product = attrs["uniq_product"] 
    obj.amount = attrs["amount"] 
    obj.started_at = attrs["started_at"] 
    obj.month_started_at = attrs["month_started_at"]
    obj.year_started_at = attrs["year_started_at"]

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
    "Operation::Product::Entity".constantize
  end

  def self.mapper
    "Operations::Products::EntityMapper".constantize
  end
  
ENUM_NAME = {
                "medpj" => "Med PJ",
                "medpf" => "Med PF",
                "medfat" => "Med Faturamento",
                "medseg" => "Med Seguros",
                "medfin" => "Med Finanças"
              }
  
  PRODUCT_PATH = {
                "medpj" => {"receivement" =>"pj-medica", "practice" =>"pj-medica"},
                "medpf" => {"receivement" =>"declaracao-imposto-de-renda", "practice" =>"livro-caixa"},
                "medfat" => {"receivement" =>"recebimentos", "practice" =>"faturamento-medico"},
              }

  CONFIG_PATH = {
                "medpj" => {"receivement" =>"pj-medica", "practice" =>"pj-medica"},
                "medpf" => {"receivement" =>"declaracao-imposto-de-renda", "practice" =>"livro-caixa"},
                "medfat" => "/a/configuracoes-recebimentos",
              }
              

  ENUM_KIND = {
                "receivement" => "Recebimento",
                "practice" => "Consultório"
              }

  CONTROLLER_PATH = {
                      "receivements" => {"name" =>"medfat", "kind" =>"receivement"},
                    }

end