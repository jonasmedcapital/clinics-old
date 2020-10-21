class Operations::Products::Clinics::Corporates::SocialContracts::Create

  def initialize(params)
    @social_contract_params = params.require(:social_contract).permit()

    @social_contract = social_contract
  end

  def social_contract
    ::Operations::Products::Clinics::Corporates::SocialContractRepository.build(@social_contract_params)
  end
  
  def save
    ActiveRecord::Base.transaction do
      if @social_contract.save
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
      cln = ::Operations::Products::Clinics::Corporates::SocialContractRepository.read(@social_contract)
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
      return "Contrato Social criado com sucesso"
    else
      return "Tivemos problemas para criar o Contrato Social"
    end
  end
  
  

end
