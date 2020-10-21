class Operations::Products::Clinics::Contracts::Takers::Update
  def initialize(params)
    @taker_params = params.require(:taker).permit(:id, :active)

    taker.attributes = @taker_params
    @taker = taker
    # @valid = @taker.valid?
  end

  def taker
    @taker ||= ::Operations::Products::Clinics::Contracts::TakerRepository.find_by_id(@taker_params[:id])
  end

  def save
    ActiveRecord::Base.transaction do
      if @taker.save
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
      cln = ::Operations::Products::Clinics::Contracts::TakerRepository.read(@taker)
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
      return "Tomador atualizado com sucesso"
    else
      return "Tivemos problemas para atualizar o tomador"
    end
  end

end
