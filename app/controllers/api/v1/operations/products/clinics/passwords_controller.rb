class API::V1::Operations::Products::PasswordsControllerController < ApplicationController

  def create
    email = ::Operations::Products::PasswordsController::Create.new(params)
    render :json => {:status => email.status, :process => email.process?, :type => email.type, :message => email.message, :data => email.data}.as_json
  end

  def update
    email = ::Operations::Products::PasswordsController::Update.new(params)
    render :json => {:status => email.status, :process => email.process?, :type => email.type, :message => email.message, :data => email.data}.as_json
  end
  
  def read
    email = ::Operations::Products::PasswordsController::Read.new(params)
    render :json => {:status => email.status, :process => email.process?, :type => email.type, :message => email.message, :data => email.data}.as_json
  end

  def list
    list = ::Operations::Products::PasswordsController::List.new(params)
    render :json => {:status => list.status, :process => list.process?, :type => list.type, :message => list.message, :data => list.data}.as_json
  end

end