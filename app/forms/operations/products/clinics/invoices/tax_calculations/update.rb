class Operations::Products::Clinics::Regularizations::CityRegistrations::Update
  def initialize(params)
    @city_registration_params = params.require(:city_registration).permit(:id, :active)

    city_registration.attributes = @city_registration_params
    @city_registration = city_registration
    # @valid = @city_registration.valid?
  end

  def city_registration
    @city_registration ||= ::Operations::Products::Clinics::Regularizations::CityRegistrationRepository.find_by_id(@city_registration_params[:id])
  end

  def save
    ActiveRecord::Base.transaction do
      if @city_registration.save
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
      cln = ::Operations::Products::Clinics::Regularizations::CityRegistrationRepository.read(@city_registration)
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
      return "Inscrição municipal atualizada com sucesso"
    else
      return "Tivemos problemas para atualizar a inscrição municipal"
    end
  end

end
