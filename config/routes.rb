Rails.application.routes.draw do
 
  get '/contacts' => "contacts#new"
  post "/contacts/create" => "contacts#create"

  root 'home#top'
  get "/tweets" => "tweets#new"
  post "/tweets/create" => "tweets#create"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
