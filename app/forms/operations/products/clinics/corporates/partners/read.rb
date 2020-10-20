class Operations::Products::Clinics::Corporate::Partners::Read

  def initialize(params)
    @partner_params = params.require(:partner).permit(:id)

    @partner = partner
  end

  def partner
    ::Operations::Products::Clinics::Corporate::PartnerRepository.find_by_id(@partner_params[:id])
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
    cln = ::Operations::Products::Clinics::Corporate::PartnerRepository.read(@partner)
    
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
