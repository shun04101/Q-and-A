Rails.application.routes.draw do

  get 'answers/edit'
  root 'questions#index'

  resources :questions do
    resources :answers
  end

end
