Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'login', to: 'users/sessions#new'
    delete 'logout', to: 'users/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :questions do
    collection do
      get 'select', to: 'questions#select'
      get 'practice', to: 'questions#practice'
      get 'random', to: 'questions#random'
    end
  end
  resources :study_logs, only: [:create]
  root to: 'home#top'
  resources :histories, only: [:index]
  get 'schedules/edit' => 'schedules#edit', as: :edit_schedules
  patch 'schedules/update' => 'schedules#update', as: :schedule
  resources :schedules, except: [:edit, :update] do
    member do
      patch '/completed' => 'schedules#completed'
    end 
  end
  resources :notes
  resources :note_images, only: [:create, :destroy]
end

