class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to products_path
        else
            render new_product_path
        end
    end

    def description
        get_product
        render plain: @product.description.to_s
    end

    def inventory
        get_product
        render plain: @product.in_stock?.to_s
    end



    private

    def product_params
        params.require(:product).permit(:name, :price, :inventory, :description)
    end

    def get_product
        @product = Product.find(params[:id])
    end

end
