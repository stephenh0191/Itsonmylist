Rails.application.routes.draw do

 	devise_for :users
	resources :items do
		member do
			patch :complete, :undo
		end
	end

	root 'items#index'
	get '/about', to: 'pages#about'
end
