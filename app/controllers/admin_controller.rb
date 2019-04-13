class AdminController < ApplicationController

	def products
		@products = Product.includes(:images).all
	end

	def product_edit
		@product = Product.find(params[:id])
	end

	def product_update

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
	      	params.require(:product).permit(:expire_date, :name, :sku_id, {:categories=>[]}, {:tags=>[]}, :price)
	    end
end
