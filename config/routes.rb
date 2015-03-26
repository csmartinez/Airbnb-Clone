Rails.application.routes.draw do
  root to: "rooms#index"

  resource :rooms 

  resource :reservations


  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
end
