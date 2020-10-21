class Operations::Products::Clinics::Contracts::Takers::List

  def initialize(params)
    @takers = takers
  end

  def takers
    ::Operations::Products::Clinics::Contracts::TakerRepository.all_active
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
    cln = ::Operations::Products::Clinics::Contracts::TakerRepository.list_all(@takers)
    
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