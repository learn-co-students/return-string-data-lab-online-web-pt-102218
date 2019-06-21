require 'pry'
class ProductsController < ApplicationController
    def create
        Product.create(product_params)
        redirect_to products_path
    end

    def index
        @products = Product.all
    end


    def inventory
        if Product.find(params[:id]).inventory>0
            render plain:'true'
        else
            render plain:'false'
        end
    end

    def description
        render plain:Product.find(params[:id]).description
    end
    

    private
    def product_params
        params.require(:product).permit(:name,:price,:inventory,:description)
    end

end
