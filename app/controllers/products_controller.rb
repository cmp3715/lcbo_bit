class ProductsController < ApplicationController
	require "open-uri"

	def convert_min_to_time(min)
	time =(min/60)
	end

def index
    products_json = open('http://lcboapi.com/products').read
    @products = JSON.parse(products_json)
  end

 def show
 	products_json = open("http://lcboapi.com/products/#{params[:id]}").read

    product_hash = JSON.parse(products_json)
    @product = product_hash["result"]
 	end

  	helper_method :convert_min_to_time
end
