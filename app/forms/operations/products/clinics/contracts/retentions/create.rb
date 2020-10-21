class Operations::Products::Clinics::Contracts::Retentions::Create

  def initialize(params)
    @retention_params = params.require(:retention).permit()

    @retention = retention
  end

  def retention
    ::Operations::Products::Clinics::Contracts::RetentionRepository.build(@retention_params)
  end
  
  def save
    ActiveRecord::Base.transaction do
      if @retention.save
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
      cln = ::Operations::Products::Clinics::Contracts::RetentionRepository.read(@retention)
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
      return "Retenção criada com sucesso"
    else
      return "Tivemos problemas para criar a retenção"
    end
  end
  
  

end
