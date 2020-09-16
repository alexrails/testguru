Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  root 'tests#index'

  get 'all_badges', to: 'user_badges#all_badges'

  resources :feedbacks, only: %i[new create]
  resources :user_badges, only: %i[index]

  resources :tests, only: :index do
    member do
      post :start
    end
  end
  #GET user_passed_test/10/result
  resources :user_passed_tests, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
  end

  namespace :admin do
    resources :badges
    resources :gists, shallow: true
  end
end
