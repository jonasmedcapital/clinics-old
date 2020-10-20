class Operations::Products::Clinics::Regularizations::CityRegistrations::Create

  def initialize(params)
    @city_registration_params = params.require(:city_registration).permit()

    @city_registration = city_registration
  end

  def city_registration
    ::Operations::Products::Clinics::Regularization::CityRegistrationRepository.build(@city_registration_params)
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
      cln = ::Operations::Products::Clinics::Regularization::CityRegistrationRepository.read(@city_registration)
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
      return "Incrição municipal criada com sucesso"
    else
      return "Tivemos problemas para criar o incrição municipal"
    end
  end
  
  

end
