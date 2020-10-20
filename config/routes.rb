Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, path: '/' do
    namespace :v1, path: '/' do

      namespace :users do
        namespace :accounts do
          post "specialties/list", to: "specialties#list"

          post "settings/dashboard", to: "settings#dashboard"
          
          post "entities/list", to: "entities#list"
          post "entities/read", to: "entities#read"
          post "entities/read_user", to: "entities#read_user"
          post "entities/read_products", to: "entities#read_products"
          post "entities/create", to: "entities#create"
          put "entities/update", to: "entities#update"
          
          post "contacts/read", to: "contacts#read"
          
          post "emails/list", to: "emails#list"
          post "emails/read", to: "emails#read"
          post "emails/create", to: "emails#create"
          put "emails/update", to: "emails#update"
          put "emails/delete", to: "emails#delete"
          
          post "phones/list", to: "phones#list"
          post "phones/read", to: "phones#read"
          post "phones/create", to: "phones#create"
          put "phones/update", to: "phones#update"
          put "phones/delete", to: "phones#delete"
          
          post "addresses/list", to: "addresses#list"
          post "addresses/read", to: "addresses#read"
          post "addresses/create", to: "addresses#create"
          put "addresses/update", to: "addresses#update"
          put "addresses/delete", to: "addresses#delete"
          post "addresses/cities_by_state", to: "addresses#cities_by_state"
        end

        namespace :companies do
          post "settings/dashboard", to: "settings#dashboard"

          post "entities/list", to: "entities#list"
          post "entities/read", to: "entities#read"
          post "entities/read_user", to: "entities#read_user"
          post "entities/read_products", to: "entities#read_products"
          post "entities/create", to: "entities#create"
          put "entities/update", to: "entities#update"
        end
      end

      namespace :operations do
        namespace :products do
          post "entities/create", to: "entities#create"
          post "entities/read", to: "entities#read"
          post "entities/list", to: "entities#list"
          put "entities/update", to: "entities#update"

          post "date/create", to: "date#create"
          post "date/read", to: "date#read"
          post "date/list", to: "date#list"
          put "date/update", to: "date#update"
          
          namespace :clinics do
            post "social_contracts/create", to: "social_contracts#create"
            post "social_contracts/read", to: "social_contracts#read"
            post "social_contracts/list", to: "social_contracts#list"
            put "social_contracts/update", to: "social_contracts#update"

            post "cnaes/create", to: "cnaes#create"
            post "cnaes/read", to: "cnaes#read"
            post "cnaes/list", to: "cnaes#list"
            put "cnaes/update", to: "cnaes#update"

            post "invoices/create", to: "invoices#create"
            post "invoices/read", to: "invoices#read"
            post "invoices/list", to: "invoices#list"
            put "invoices/update", to: "invoices#update"

            post "licenses/create", to: "licenses#create"
            post "licenses/read", to: "licenses#read"
            post "licenses/list", to: "licenses#list"
            put "licenses/update", to: "licenses#update"

            post "city_registration/create", to: "city_registration#create"
            post "city_registration/read", to: "city_registration#read"
            post "city_registration/list", to: "city_registration#list"
            put "city_registration/update", to: "city_registration#update"

            post "observations/create", to: "observations#create"
            post "observations/read", to: "observations#read"
            post "observations/list", to: "observations#list"
            put "observations/update", to: "observations#update"

            post "partners/create", to: "partners#create"
            post "partners/read", to: "partners#read"
            post "partners/list", to: "partners#list"
            put "partners/update", to: "partners#update"

            post "passwords/create", to: "passwords#create"
            post "passwords/read", to: "passwords#read"
            post "passwords/list", to: "passwords#list"
            put "passwords/update", to: "passwords#update"

            post "retentions/create", to: "retentions#create"
            post "retentions/read", to: "retentions#read"
            post "retentions/list", to: "retentions#list"
            put "retentions/update", to: "retentions#update"

            post "rules/create", to: "rules#create"
            post "rules/read", to: "rules#read"
            post "rules/list", to: "rules#list"
            put "rules/update", to: "rules#update"

            post "takers/create", to: "takers#create"
            post "takers/read", to: "takers#read"
            post "takers/list", to: "takers#list"
            put "takers/update", to: "takers#update"

            post "tax_calculations/create", to: "tax_calculations#create"
            post "tax_calculations/read", to: "tax_calculations#read"
            post "tax_calculations/list", to: "tax_calculations#list"
            put "tax_calculations/update", to: "tax_calculations#update"

          end
        end
      end
    end
  end
end
