# frozen_string_literal: true

Rails.application.routes.draw do
  resources :podcasts do
    resources :episodes, except: [:index]
  end

  resource :log_webhook, only: :create

  root 'podcasts#index'
end
