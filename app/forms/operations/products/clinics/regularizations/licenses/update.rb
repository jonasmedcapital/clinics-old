class Operations::Products::Clinics::Regularizations::Licenses::Update
  def initialize(params)
    @license_params = params.require(:license).permit(:id, :active)

    license.attributes = @license_params
    @license = license
    # @valid = @license.valid?
  end

  def license
    @license ||= ::Operations::Products::Clinics::Regularization::LicenseRepository.find_by_id(@license_params[:id])
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
      cln = ::Operations::Products::Clinics::Regularization::LicenseRepository.read(@license)
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
      return "#{@license.type_pretty} atualizado com sucesso"
    else
      return "Tivemos problemas para atualizar o #{@license.type_pretty}"
    end
  end

end
