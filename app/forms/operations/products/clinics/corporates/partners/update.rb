class Operations::Products::Clinics::Corporate::Partners::Update
  def initialize(params)
    @partner_params = params.require(:partner).permit(:id, :active)

    partner.attributes = @partner_params
    @partner = partner
    # @valid = @partner.valid?
  end

  def partner
    @partner ||= ::Operations::Products::Clinics::Corporate::PartnerRepository.find_by_id(@partner_params[:id])
  end

  def save
    ActiveRecord::Base.transaction do
      if @partner.save
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
      cln = ::Operations::Products::Clinics::Corporate::PartnerRepository.read(@partner)
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
