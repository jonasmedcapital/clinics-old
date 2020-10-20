class Users::Accounts::Addresses::Update
  include ActiveModel::Model

  attr_accessor :status, :type, :message

  def initialize(params)
    @account_params = params.require(:account).permit(:account_id)
    @address_params = params.require(:address).permit(:id, :active, :account_id, :postal_code, :street, :number, :complement,
                                                      :district, :city, :state, :country, :ibge, :kind, :is_main, :notes)
    @current_user_params = params.require(:current_user).permit(:current_user_id)

    return false unless can_current_user_update_address?
    
    address.attributes = @address_params
    @address = address
    @account = account
    @valid = @address.valid?
  end

  def address
    @address ||= ::Users::Accounts::AddressRepository.find_by_id(@address_params[:id])
  end
  
  def account
    @account ||= ::Users::Accounts::EntityRepository.find_by_id(@account_params[:account_id])
  end

  def current_user
    @current_user ||= ::Users::UserRepository.new.find_by_id(@current_user_params[:current_user_id])
  end

  def process?
    return false unless can_current_user_update_address?
    true
  end

  def status
    return :forbidden unless can_current_user_update_address?
    if @valid
      return :ok
    else
      return :bad_request
    end
  end

  def message
    return message = "A ação não é permitida" unless can_current_user_update_address?
    if @valid
      message = "Endereço atualizado com sucesso!"
      return message
    else
      message = "Tivemos seguinte(s) problema(s):"
      i = 0
      @address.errors.messages.each do |key, value|
        i += 1
        message += " (#{i}) #{value.first}"
      end
      return message
    end
  end

  def type
    return "danger" unless can_current_user_update_address?
    if @valid
      return "success"
    else
      return "danger"
    end
  end

  def data
    return false unless can_current_user_update_address?
    ActiveRecord::Base.transaction do
      if @valid
        @address.save
        {total_address: @account.addresses.count, address: @address}
      else
        false
        raise ActiveRecord::Rollback
      end
    end
  end

  private

  def can_current_user_update_address?
    @can_current_user_update_address ||= ::UserPolicies.new(current_user.id, "update", "addresses").can_current_user?
  end

end