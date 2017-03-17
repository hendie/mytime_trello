Rails.application.routes.draw do
  resources :boards do
    resources :lists do
      resources :cards do
        member do
          patch 'move/:move_id' => 'cards#move'
        end
      end
    end
  end
end
