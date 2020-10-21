class Operations::Products::Clinics::Contracts::Observations::Create

  def initialize(params)
    @observation_params = params.require(:observation).permit()

    @observation = observation
  end

  def observation
    ::Operations::Products::Clinics::Contracts::ObservationRepository.build(@observation_params)
  end
  
  def save
    ActiveRecord::Base.transaction do
      if @observation.save
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
      cln = ::Operations::Products::Clinics::Contracts::ObservationRepository.read(@observation)
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
      return "Observação criada com sucesso"
    else
      return "Tivemos problemas para criar a observação"
    end
  end
  
  

end
