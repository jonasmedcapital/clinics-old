class API::V1::Users::Accounts::ContactsController < ApplicationController
          
  def read
    contacts = ::Users::Accounts::Contacts::Read.new(params)
    render :json => {:status => contacts.status, :process => contacts.process?, :type => contacts.type, :message => contacts.message, :data => contacts.data}.as_json
  end

  def list
    list = ::Users::Accounts::Contacts::List.new(params)
    render :json => {:status => list.status, :process => list.process?, :type => list.type, :message => list.message, :data => list.data}.as_json
  end
  
end