Rails.application.routes.draw do
  resources :comments do
    collection do
      post :confirm
      get :top
    end
  end
  root to: 'comments#top'
end