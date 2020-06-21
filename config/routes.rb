# frozen_string_literal: true

Rails.application.routes.draw do
  resources :podcasts

  root 'podcasts#index'
end
