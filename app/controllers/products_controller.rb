class ProductsController < ApplicationController

    def new
        @product = Product.new
    end

    def create
        prod = Product.create(product_params)
        redirect_to products_path
    end

    def index
        @products = Product.all 
    end

    def inventory
        prod = Product.find(params[:id])
        if prod.inventory.to_i > 0
            render plain: "true"
        else
            render plain: "false"
        end
    end

    def description
        prod = Product.find(params[:id])
        if prod.description
            render plain: prod.description
        else
            render plain: "false"
        end
    end

    private

    def product_params
        params.require(:product).permit(:description, :inventory, :name, :price)
    end

end
