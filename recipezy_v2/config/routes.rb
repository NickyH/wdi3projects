RecipezyV2::Application.routes.draw do

root :to => 'home#index'

resources :users, :tutorials, :ingredients
resources :recipes do
    member do
      get :keyingredient
    end
  end

get '/login' => 'session#new'
post '/login' => 'session#create'
delete '/login' => 'session#destroy'

end



