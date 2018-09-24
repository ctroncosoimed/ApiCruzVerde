Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
    post 'login' => 'login#token'
    post 'firma_electronica' => 'firma_electronica#index'
  end  
end
