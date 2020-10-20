class Operations::Products::Entities::Read

  def initialize(params)
    @product_params = params.require(:product).permit(:id)

    @product = product
  end

  def product
    ::Operations::Products::EntityRepository.find_by_id(@product_params[:id])
  end

  def status
    @status
  end

  def process?
    @process
  end

  def type
    @type
  end

  def message
    @message
  end

  def data
    cln = ::Operations::Products::EntityRepository.read(@product)
    
    if cln.empty?
      @status = :ok
      @process = false
      @message = "Não conseguimos carregar os dados"
      @type = "danger"
    else
      @status = :ok
      @process = true
      @message = ""
      @type = "success"
    end
    
    return {:cln => cln.compact}.as_json
  end
  
end
