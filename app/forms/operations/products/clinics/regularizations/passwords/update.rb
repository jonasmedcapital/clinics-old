class Operations::Products::Clinics::Regularizations::Passwords::Update
  def initialize(params)
    @password_params = params.require(:password).permit(:id, :active)

    password.attributes = @password_params
    @password = password
    # @valid = @password.valid?
  end

  def password
    @password ||= ::Operations::Products::Clinics::Regularizations::PasswordRepository.find_by_id(@password_params[:id])
  end

  def save
    ActiveRecord::Base.transaction do
      if @password.save
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
      cln = ::Operations::Products::Clinics::Regularizations::PasswordRepository.read(@password)
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
      return "Senha atualizada com sucesso"
    else
      return "Tivemos problemas para atualizar a senha"
    end
  end

end
