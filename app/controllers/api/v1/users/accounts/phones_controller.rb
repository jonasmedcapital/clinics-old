class API::V1::Users::Accounts::PhonesController < ApplicationController

  def create
    phone = ::Users::Accounts::Phones::Create.new(params)
    render :json => {:status => phone.status, :process => phone.process?, :type => phone.type, :message => phone.message, :data => phone.data}.as_json
  end

  def update
    phone = ::Users::Accounts::Phones::Update.new(params)
    render :json => {:status => phone.status, :process => phone.process?, :type => phone.type, :message => phone.message, :data => phone.data}.as_json
  end
  
  def read
    phone = ::Users::Accounts::Phones::Read.new(params)
    render :json => {:status => phone.status, :process => phone.process?, :type => phone.type, :message => phone.message, :data => phone.data}.as_json
  end

  def list
    list = ::Users::Accounts::Phones::List.new(params)
    render :json => {:status => list.status, :process => list.process?, :type => list.type, :message => list.message, :data => list.data}.as_json
  end

end