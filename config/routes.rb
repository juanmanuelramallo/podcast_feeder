# frozen_string_literal: true

Rails.application.routes.draw do
  resources :podcasts do
    resources :episodes, except: [:index]
  end

  get '/*slug', to: 'landing#show'

  root 'landing#show'
end
