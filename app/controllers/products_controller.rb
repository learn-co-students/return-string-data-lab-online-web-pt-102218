class ProductsController < ApplicationController

  def create
    p = Product.new(product_attributes)
    if p.save
      return redirect_to products_path
      
    end
  end

  def index
    @products = Product.all
  end

  def inventory
    @p = Product.find_by_id(inventory_attributes["id"])
    render plain: (@p.inventory ? @p.inventory > 0 : false).to_s
  end

  def description
    @p = Product.find_by_id(inventory_attributes["id"])
    render plain: @p.description
  end

  private
  
  def product_attributes
    params.permit("product")
  end

  def inventory_attributes
    params.permit("id")
  end
end
