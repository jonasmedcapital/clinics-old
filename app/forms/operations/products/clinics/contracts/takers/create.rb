class Operations::Products::Clinics::Contracts::Takers::Create

  def initialize(params)
    @taker_params = params.require(:taker).permit()

    @taker = taker
  end

  def taker
    ::Operations::Products::Clinics::Contracts::TakerRepository.build(@taker_params)
  end
  
  def save
    ActiveRecord::Base.transaction do
      if @taker.save
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
      cln = ::Operations::Products::Clinics::Contracts::TakerRepository.read(@taker)
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
      return "Tomador criada com sucesso"
    else
      return "Tivemos problemas para criar o tomador"
    end
  end
  
  

end
