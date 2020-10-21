class Operations::Products::Clinics::Contracts::Takers::Read

  def initialize(params)
    @taker_params = params.require(:taker).permit(:id)

    @taker = taker
  end

  def taker
    ::Operations::Products::Clinics::Contracts::TakerRepository.find_by_id(@taker_params[:id])
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
    cln = ::Operations::Products::Clinics::Contracts::TakerRepository.read(@taker)
    
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
