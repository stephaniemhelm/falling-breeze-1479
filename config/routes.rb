Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'gardens/:id',        to: 'gardens#show'

  get '/plots',            to: 'plots#index'

  get 'plots/:id/plant',   to: 'plot_plants#destroy'
end
