Questionnaire::Application.routes.draw do
  resources :surveys, :path => '' do
  	member do 
    	get  :add
  	end
  end
  root to: 'surveys#index'


end
