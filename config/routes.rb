Rails.application.routes.draw do
  root :to => "pages#index"
  scope :api, defaults: {format: :json} do
    resources :cities, except: [:new, :edit]
    resources :states, except: [:new, :edit]
  end
 end
