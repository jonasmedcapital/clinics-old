class Operations::Products::Clinics::Regularizations::Licenses::Create

  def initialize(params)
    @license_params = params.require(:license).permit()

    @license = license
  end

  def license
    ::Operations::Products::Clinics::Regularizations::LicenseRepository.build(@license_params)
  end
  
  def save
    ActiveRecord::Base.transaction do
      if @license.save
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
      cln = ::Operations::Products::Clinics::Regularizations::LicenseRepository.read(@license)
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
      return "#{@license.type_pretty} criado com sucesso"
    else
      return "Tivemos problemas para criar o #{@license.type_pretty}"
    end
  end
  
  

end
