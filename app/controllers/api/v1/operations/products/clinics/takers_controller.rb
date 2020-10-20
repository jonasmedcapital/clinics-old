class API::V1::Operations::Products::TakersControllerController < ApplicationController

  def create
    email = ::Operations::Products::TakersController::Create.new(params)
    render :json => {:status => email.status, :process => email.process?, :type => email.type, :message => email.message, :data => email.data}.as_json
  end

  def update
    email = ::Operations::Products::TakersController::Update.new(params)
    render :json => {:status => email.status, :process => email.process?, :type => email.type, :message => email.message, :data => email.data}.as_json
  end
  
  def read
    email = ::Operations::Products::TakersController::Read.new(params)
    render :json => {:status => email.status, :process => email.process?, :type => email.type, :message => email.message, :data => email.data}.as_json
  end

  def list
    list = ::Operations::Products::TakersController::List.new(params)
    render :json => {:status => list.status, :process => list.process?, :type => list.type, :message => list.message, :data => list.data}.as_json
  end

end