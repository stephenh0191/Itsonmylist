Rails.application.routes.draw do
	devise_for :users
	resources :items do
		member do
			
			patch :complete
			
		end

	end
	root 'items#index'
		get '/about' => 'page#about'
		post "versions/:id/revert" => "versions#revert", :as => "revert_version"
end
