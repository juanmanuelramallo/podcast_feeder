# frozen_string_literal: true

Rails.application.routes.draw do
  resources :podcasts do
    resources :episodes
  end

  root 'podcasts#index'
end
