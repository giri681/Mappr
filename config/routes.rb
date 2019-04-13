Rails.application.routes.draw do
   	namespace :api do
  		namespace :v1 do
   			resources :products
  		end
 	end

 	get "admin/products"
 	get "admin/:id/product_edit" => "admin#product_edit", as: "edit_product"
 	post "admin/:id/product_update" => "admin#product_update", as: "update_product"

 	# root :to => 'admin#products'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
