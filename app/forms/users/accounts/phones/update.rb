module Users
  module Accounts
    module Phones
      class Update    
        include ActiveModel::Model

        attr_accessor :status, :type, :message

        def initialize(params)
          @account_params = params.require(:account).permit(:account_id)
          @phone_params = params.require(:phone).permit(:id, :ddd, :number, :uniq_number, :kind, :is_main, :notes, :active)
          @current_user_params = params.require(:current_user).permit(:current_user_id)

          return false unless can_current_user_update_phone?
          
          phone.attributes = @phone_params
          @phone = phone
          @account = account
          @valid = @phone.valid?
        end

        def phone
          @phone ||= ::Users::Accounts::PhoneRepository.find_by_id(@phone_params[:id])
        end
        
        def account
          @account ||= ::Users::Accounts::EntityRepository.find_by_id(@account_params[:account_id])
        end

        def current_user
          @current_user ||= ::Users::UserRepository.new.find_by_id(@current_user_params[:current_user_id])
        end

        def process?
          return false unless can_current_user_update_phone?
          true
        end

        def status
          return :forbidden unless can_current_user_update_phone?
          if @valid
            return :ok
          else
            return :bad_request
          end
        end

        def message
          return message = "A ação não é permitida" unless can_current_user_update_phone?
          if @valid
            message = "Telefone atualizado com sucesso!"
            return message
          else
            message = "Tivemos seguinte(s) problema(s):"
            i = 0
            @phone.errors.messages.each do |key, value|
              i += 1
              message += " (#{i}) #{value.first}"
            end
            return message
          end
        end

        def type
          return "danger" unless can_current_user_update_phone?
          if @valid
            return "success"
          else
            return "danger"
          end
        end

        def data
          return false unless can_current_user_update_phone?
          ActiveRecord::Base.transaction do
            if @valid
              @phone.save
              {total_phone: @account.phones.count, phone: @phone}
            else
              false
              raise ActiveRecord::Rollback
            end
          end
        end

        private

        def can_current_user_update_phone?
          @can_current_user_update_phone ||= ::UserPolicies.new(current_user.id, "update", "phones").can_current_user?
        end

      end
    end
  end
end