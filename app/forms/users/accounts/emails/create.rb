module Users
  module Accounts
    module Emails
      class Create    
        include ActiveModel::Model

        attr_accessor :status, :type, :message

        def initialize(params)
          @account_params = params.require(:account).permit(:account_id)
          @email_params = params.require(:email).permit(:id, :address, :kind, :is_main, :notes)
          @current_user_params = params.require(:current_user).permit(:current_user_id)

          return false unless can_current_user_create_email?
          
          email.attributes = @email_params
          @email = email
          @account = account
          @valid = @email.valid?
        end

        def email
          @email ||= ::Users::Accounts::EmailRepository.build(@account_params[:account_id])
        end
        
        def account
          @account ||= ::Users::Accounts::EntityRepository.find_by_id(@account_params[:account_id])
        end

        def current_user
          @current_user ||= ::Users::UserRepository.new.find_by_id(@current_user_params[:current_user_id])
        end

        def process?
          return false unless can_current_user_create_email?
          true
        end

        def status
          return :forbidden unless can_current_user_create_email?
          if @valid
            return :created
          else
            return :bad_request
          end
        end

        def message
          return message = "A ação não é permitida" unless can_current_user_create_email?
          if @valid
            message = "E-mail criado com sucesso!"
            return message
          else
            message = "Tivemos seguinte(s) problema(s):"
            i = 0
            @email.errors.messages.each do |key, value|
              i += 1
              message += " (#{i}) #{value.first}"
            end
            return message
          end
        end

        def type
          return "danger" unless can_current_user_create_email?
          if @valid
            return "success"
          else
            return "danger"
          end
        end

        def data
          return false unless can_current_user_create_email?
          ActiveRecord::Base.transaction do
            if @valid
              @email.save
              {total_email: @account.emails.count, email: @email}
            else
              false
              raise ActiveRecord::Rollback
            end
          end
        end

        private

        def can_current_user_create_email?
          @can_current_user_create_email ||= ::UserPolicies.new(current_user.id, "create", "emails").can_current_user?
        end

      end
    end
  end
end