class Operations::Products::Dates::Read

  def initialize(params)
    @date_params = params.require(:date).permit(:id)

    @date = date
  end

  def date
    ::Operations::Products::DateRepository.find_by_id(@date_params[:id])
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
    cln = ::Operations::Products::DateRepository.read(@date)
    
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
