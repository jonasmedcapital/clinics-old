class Operations::Products::Clinics::Corporate::Cnaes::List

  def initialize(params)
    @cnaes = cnaes
  end

  def cnaes
    ::Operations::Products::Clinics::Corporates::CnaeRepository.all_active
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
    cln = ::Operations::Products::Clinics::Corporates::CnaeRepository.list_all(@cnaes)
    
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