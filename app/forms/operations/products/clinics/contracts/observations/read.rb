class Operations::Products::Clinics::Contracts::Observations::Read

  def initialize(params)
    @observation_params = params.require(:observation).permit(:id)

    @observation = observation
  end

  def observation
    ::Operations::Products::Clinics::Contracts::ObservationRepository.find_by_id(@observation_params[:id])
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
    cln = ::Operations::Products::Clinics::Contracts::ObservationRepository.read(@observation)
    
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
