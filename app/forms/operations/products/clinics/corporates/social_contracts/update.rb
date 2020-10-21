class Operations::Products::Clinics::Corporate::SocialContracts::Update
  def initialize(params)
    @social_contract_params = params.require(:social_contract).permit(:id, :active)

    social_contract.attributes = @social_contract_params
    @social_contract = social_contract
    # @valid = @social_contract.valid?
  end

  def social_contract
    @social_contract ||= ::Operations::Products::Clinics::Corporates::SocialContractRepository.find_by_id(@social_contract_params[:id])
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
      return "Contrato Social atualizado com sucesso"
    else
      return "Tivemos problemas para atualizar o Contrato Social"
    end
  end

end
