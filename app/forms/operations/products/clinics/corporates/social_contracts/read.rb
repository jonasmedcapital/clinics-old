class Operations::Products::Clinics::Corporate::SocialContracts::Read

  def initialize(params)
    @social_contract_params = params.require(:social_contract).permit(:id)

    @social_contract = social_contract
  end

  def social_contract
    ::Operations::Products::Clinics::Corporates::SocialContractRepository.find_by_id(@social_contract_params[:id])
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
    cln = ::Operations::Products::Clinics::Corporates::SocialContractRepository.read(@social_contract)
    
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
