class ProductsController < ApplicationController


    def new 
    end 

    def index 
        @products = Product.all 
    end 

    def description 
        @product = Product.find(params[:id])
        render plain: @product.description 
    end 

    def inventory 
        @product = Product.find(params[:id]) 
        render plain: @product.inventory > 0 ? true : false
    end 

    def create
        @product = Product.new(product_params)
        @product.save
        redirect_to products_path
    end 

    private 

    def product_params 
        params.require(:product).permit(:description, :inventory, :name, :price)
    end 

end
