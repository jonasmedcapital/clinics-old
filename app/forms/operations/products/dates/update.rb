class Operations::Products::Dates::Update
  def initialize(params)
    @date_params = params.require(:date).permit(:id, :active, :open, :product_id, :month, :year, :uniq_product_date)

    date.attributes = @date_params
    @date = date
    # @valid = @date.valid?
  end

  def date
    @date ||= ::Operations::Products::DateRepository.find_by_id(@date_params[:id])
  end

  def save
    ActiveRecord::Base.transaction do
      if @date.save
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
      cln = ::Operations::Products::DateRepository.read(@date)
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
      return "Data atualizada com sucesso"
    else
      return "Tivemos problemas para atualizar a data"
    end
  end

end
