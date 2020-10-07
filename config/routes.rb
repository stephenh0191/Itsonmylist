Rails.application.routes.draw do

 	devise_for :users
	resources :items do
		member do
			patch :complete, :undo
		end
	end

	root 'items#index'
end
