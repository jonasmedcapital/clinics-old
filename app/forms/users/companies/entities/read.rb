class Users::Companies::Entities::Read

  def initialize(params)
    @company_params = params.require(:company).permit(:id)

    @company = company
  end

  def company
    ::Users::Companies::EntityRepository.find_by_id(@company_params[:id])
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
    cln = ::Users::Companies::EntityRepository.read(@company)

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
