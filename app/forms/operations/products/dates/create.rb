class Operations::Products::Dates::Create

  def initialize(params)
    @date_params = params.require(:date).permit(:open, :product_id, :month, :year, :uniq_product_date)

    @date = date
  end

  def date
    ::Operations::Products::DateRepository.build(@date_params)
  end
  
  def save
    ActiveRecord::Base.transaction do
      if @date.save
        @data = true
        @status = true
        @process = true
        @type = true
        @message = true        
        Operations::Products::Dates::CreateCalculationAchievementService.new(@date)
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
      return "Data criada com sucesso"
    else
      return "Tivemos problemas para criar a data"
    end
  end
  
  

end

