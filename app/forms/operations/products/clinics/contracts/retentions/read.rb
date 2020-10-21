class Operations::Products::Clinics::Contracts::Retentions::Read

  def initialize(params)
    @retention_params = params.require(:retention).permit(:id)

    @retention = retention
  end

  def retention
    ::Operations::Products::Clinics::Contracts::RetentionRepository.find_by_id(@retention_params[:id])
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
    cln = ::Operations::Products::Clinics::Contracts::RetentionRepository.read(@retention)
    
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
