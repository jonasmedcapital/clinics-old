class Operations::Products::Clinics::Regularizations::Licenses::Read

  def initialize(params)
    @license_params = params.require(:license).permit(:id)

    @license = license
  end

  def license
    ::Operations::Products::Clinics::Regularizations::LicenseRepository.find_by_id(@license_params[:id])
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
    cln = ::Operations::Products::Clinics::Regularizations::LicenseRepository.read(@license)
    
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
