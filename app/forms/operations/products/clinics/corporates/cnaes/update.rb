class Operations::Products::Clinics::Corporate::Cnaes::Update
  def initialize(params)
    @cnae_params = params.require(:cnae).permit(:id, :active)

    cnae.attributes = @cnae_params
    @cnae = cnae
    # @valid = @cnae.valid?
  end

  def cnae
    @cnae ||= ::Operations::Products::Clinics::Corporates::CnaeRepository.find_by_id(@cnae_params[:id])
  end

  def save
    ActiveRecord::Base.transaction do
      if @cnae.save
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
      cln = ::Operations::Products::Clinics::Corporates::CnaeRepository.read(@cnae)
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
      return "Sócio atualizado com sucesso"
    else
      return "Tivemos problemas para atualizar o sócio"
    end
  end

end
