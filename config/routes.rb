Rails.application.routes.draw do
  root to: "rooms#index"

  resource :rooms do
    resource :reservations
  end
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
end
