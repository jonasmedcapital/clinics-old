class Operations::Products::Clinics::Regularizations::Passwords::Read

  def initialize(params)
    @password_params = params.require(:password).permit(:id)

    @password = password
  end

  def password
    ::Operations::Products::Clinics::Regularization::PasswordRepository.find_by_id(@password_params[:id])
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
    cln = ::Operations::Products::Clinics::Regularization::PasswordRepository.read(@password)
    
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
