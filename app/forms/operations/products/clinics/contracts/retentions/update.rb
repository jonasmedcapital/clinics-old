class Operations::Products::Clinics::Contracts::Retentions::Update
  def initialize(params)
    @retention_params = params.require(:retention).permit(:id, :active)

    retention.attributes = @retention_params
    @retention = retention
    # @valid = @retention.valid?
  end

  def retention
    @retention ||= ::Operations::Products::Clinics::Contracts::RetentionRepository.find_by_id(@retention_params[:id])
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
      return "Retenção atualizada com sucesso"
    else
      return "Tivemos problemas para atualizar a Retenção"
    end
  end

end
