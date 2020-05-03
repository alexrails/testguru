Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  #get 'sessions/new'
  #get 'users/new'
  root 'tests#index'

  resources :tests, only: :index do
    member do
      post :start
    end
  end
  #GET user_passed_test/10/result
  resources :user_passed_tests, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
