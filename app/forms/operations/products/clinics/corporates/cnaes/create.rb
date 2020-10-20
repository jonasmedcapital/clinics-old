class Operations::Products::Clinics::Corporates::Cnaes::Create

  def initialize(params)
    @cnae_params = params.require(:cnae).permit()

    @cnae = cnae
  end

  def cnae
    ::Operations::Products::Clinics::Corporate::CnaeRepository.build(@cnae_params)
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
      cln = ::Operations::Products::Clinics::Corporate::CnaeRepository.read(@cnae)
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
      return "CNAE criado com sucesso"
    else
      return "Tivemos problemas para criar o CNAE"
    end
  end
  
  

end
