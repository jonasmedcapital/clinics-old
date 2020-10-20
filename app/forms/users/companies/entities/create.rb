class Users::Companies::Entities::Create

  def initialize(params)
    @company_params = params.require(:company).permit(:name, :cnpj)

    @company = company
  end

  def company
    ::Users::Companies::EntityRepository.build(@company_params)
  end
  
  def save

    # @data = true
    # @status = true
    # @process = true
    # @type = true
    # @message = true
    # true

    ActiveRecord::Base.transaction do
      if @company.save
        @data = true
        @status = true
        @process = true
        @type = true
        @message = true
        true
      else
        @data = false
        @status = false
        @process = false
        @type = false
        @message = false
        false
      end
    end
  end
  
  def data
    if @data
      cln = ::Users::Companies::EntityRepository.read(@company)
    else
      cln = []
    end
    
    return {:cln => cln.compact}.as_json
  end

  def status
    if @status
      return :created
    else
      return :bad_request
    end
  end
  
  def type
    if @type
      return "success"
    else
      return "danger"
    end
  end
  
  def message
    if @message
      return "Empresa criada com sucesso"
    else
      return "Tivemos problemas para criar a empresa"
    end
  end
  
  

end
