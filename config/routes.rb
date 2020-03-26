Rails.application.routes.draw do
  root 'tests#index'
  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: :index
    end
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
end
