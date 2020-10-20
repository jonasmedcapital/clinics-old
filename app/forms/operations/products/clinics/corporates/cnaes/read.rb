class Operations::Products::Clinics::Corporate::Cnaes::Read

  def initialize(params)
    @cnae_params = params.require(:cnae).permit(:id)

    @cnae = cnae
  end

  def cnae
    ::Operations::Products::Clinics::Corporate::CnaeRepository.find_by_id(@cnae_params[:id])
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
    cln = ::Operations::Products::Clinics::Corporate::CnaeRepository.read(@cnae)
    
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
