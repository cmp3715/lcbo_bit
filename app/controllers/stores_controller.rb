class StoresController < ApplicationController
	require 'open-uri'
  
  def index
    stores_json = open('http://lcboapi.com/stores?page=20').read
    @stores = JSON.parse(stores_json)
  end


  def show
    store_json = open("http://lcboapi.com/stores/#{params[:id]}").read
    store_hash = JSON.parse(store_json)
    @store = store_hash["result"]
  end
end
