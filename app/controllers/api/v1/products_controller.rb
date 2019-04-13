class Api::V1::ProductsController < ApplicationController

  # creating products
  def create
    if params[:id].present?
      update
    else
      @product = Product.new(product_params)

      if @product.save
        render json: @product, status: :created
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end
  end

  #updating poduct
  def update

    #to get product
    @product = Product.find(params[:id])

    #split & storing array in variable
    categories = params[:product][:categories].split(" ")
    tags = params[:product][:tags].split(" ")

    #checking & assigning categories into product categories
    categories.each do |category|
      @product.categories << category unless @product.categories.include?(category)
    end

    #checking & assigning tags into product tags
    tags.each do |tag|
      @product.tags << tag unless @product.tags.include?(tag)
    end

    #updating product
    if @product.update(product_params)
        redirect_to '/admin/products'
      else
        redirect_to :back
      end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def product_params
      product_params = params.require(:product).permit(:expire_date, :name, :sku_id, {:categories=>[]}, {:tags=>[]}, :price, { images: [:id, :img_path] })
      product_params[:images_attributes] = product_params.delete :images
      product_params.permit!
    end
end
