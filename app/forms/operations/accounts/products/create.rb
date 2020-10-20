class Operations::Accounts::Products::Create

  def initialize(params)
    @product_params = params.require(:product).permit(:account_id, :return_id, :book_id, :legal_id, :billing_id, :receivement_id)
    @product = product
  end

  def product
    ::Operations::Accounts::ProductRepository.build(@product_params)
  end
  
  def save
    ActiveRecord::Base.transaction do
      if @product.save
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
      cln = ::Operations::Accounts::ProductRepository.read(@product)
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
      return "Produto criado com sucesso"
    else
      return "Tivemos problemas para criar o produto"
    end
  end
  
  

end

