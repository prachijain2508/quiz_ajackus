Rails.application.routes.draw do
  namespace :admin do
    resources :quizzes
  end

  resources :quizzes, only: [:show] do
    resources :attempts, only: [:create]
  end

  root to: "admin/quizzes#index"
end
