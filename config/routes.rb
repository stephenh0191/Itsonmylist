Rails.application.routes.draw do
	post "versions/:id/revert" => "versions#revert", :as => "revert_version"
	devise_for :users
	resources :items do
		member do
			
			patch :complete
			
		end

	end
	root 'items#index'
		get '/about' => 'pages#about'
		get '/contact' => 'pages#contact'

end
