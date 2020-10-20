class Operations::Products::Entities::Update
  def initialize(params)
    @product_params = params.require(:product).permit(:id, :active, :account_id, :name, :kind, :uniq_product, :amount, :started_at, :month_started_at, :year_started_at)

    product.attributes = @product_params
    @product = product
    # @valid = @product.valid?
  end

  def product
    @product ||= ::Operations::Products::EntityRepository.find_by_id(@product_params[:id])
  end

  def save
    ActiveRecord::Base.transaction do
      if @product.save
        @data = true
        @status = true
        @process = true
        @type = true
        @message = true
        Operations::Products::VerifyProductKindService.new(@product) if !@product.active
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
      cln = ::Operations::Products::EntityRepository.read(@product)
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
      return "Produto atualizado com sucesso"
    else
      return "Tivemos problemas para atualizar o produto"
    end
  end

end
