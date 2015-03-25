Rails.application.routes.draw do
  root to: "room#index"

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
end
