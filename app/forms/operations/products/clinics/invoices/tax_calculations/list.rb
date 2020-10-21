class Operations::Products::Clinics::Regularizations::CityRegistrations::List

  def initialize(params)
    @city_registrations = city_registrations
  end

  def city_registrations
    ::Operations::Products::Clinics::Regularizations::CityRegistrationRepository.all_active
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
    cln = ::Operations::Products::Clinics::Regularizations::CityRegistrationRepository.list_all(@city_registrations)
    
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