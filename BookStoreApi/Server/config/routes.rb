# frozen_string_literal: true

# == Route Map
#
# ruby/3.0.1 isn't supported by this pry-doc version

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :category
    end
  end

end
