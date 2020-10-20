class Operations::Products::Clinics::Corporate::SocialContracts::List

  def initialize(params)
    @socail_contracts = socail_contracts
  end

  def socail_contracts
    ::Operations::Products::Clinics::Corporate::SocialContractRepository.all_active
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
    cln = ::Operations::Products::Clinics::Corporate::SocialContractRepository.list_all(@socail_contracts)
    
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