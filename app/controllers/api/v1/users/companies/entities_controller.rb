class API::V1::Users::Companies::EntitiesController < ApplicationController

  def create
    company = ::Users::Companies::Entities::Create.new(params)
    render :json => {:status => company.status, :process => company.process?, :type => company.type, :message => company.message, :save => company.save}.as_json
  end

  def update
    company = ::Users::Companies::Entities::Update.new(params)
    render :json => {:status => company.status, :process => company.process?, :type => company.type, :message => company.message, :save => company.save}.as_json
  end
  
  def read
    company = ::Users::Companies::Entities::Read.new(params)
    render :json => {:status => company.status, :process => company.process?, :type => company.type, :message => company.message, :data => company.data}.as_json
  end

  def list
    list = ::Users::Companies::Entities::List.new(params)
    render :json => {:status => list.status, :process => list.process?, :type => list.type, :message => list.message, :data => list.data}.as_json
  end

  def read_user
    user = ::Users::Companies::Entities::ReadUser.new(params)
    render :json => {:status => user.status, :process => user.process?, :type => user.type, :message => user.message, :data => user.data}.as_json
  end
  
  def read_products
    products = ::Users::Companies::Entities::ReadProducts.new(params)
    render :json => {:status => products.status, :process => products.process?, :type => products.type, :message => products.message, :data => products.data}.as_json
  end

end