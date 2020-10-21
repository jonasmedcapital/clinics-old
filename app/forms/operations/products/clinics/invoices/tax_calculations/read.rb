class Operations::Products::Clinics::Regularizations::CityRegistrations::Read

  def initialize(params)
    @city_registration_params = params.require(:city_registration).permit(:id)

    @city_registration = city_registration
  end

  def city_registration
    ::Operations::Products::Clinics::Regularizations::CityRegistrationRepository.find_by_id(@city_registration_params[:id])
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
    cln = ::Operations::Products::Clinics::Regularizations::CityRegistrationRepository.read(@city_registration)
    
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
