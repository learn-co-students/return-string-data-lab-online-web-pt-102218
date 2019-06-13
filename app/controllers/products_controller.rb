class ProductsController < ApplicationController

  def create 
    @product = Product.create(description: params[:product][:description], inventory: params[:product][:inventory], name: params[:product][:name], price: params[:product][:price])
    redirect_to products_path
  end 

  def inventory 
    @product = Product.find(params[:id])
    if @product
      if @product.inventory > 0 
        render plain: "true"
      else 
        render plain: "false"
      end 
    end 
  end 

  def index 
    @products = Product.all 
  end

  def description 
    @product = Product.find(params[:id])
      render plain: @product.description 
  end 

end
