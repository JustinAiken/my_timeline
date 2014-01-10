MyTimeline::Engine.routes.draw do
  root to: "events#index"

  resources :events
  resources :posts

  get "control_panel" => "control_panel#index", as: "control_panel"
end
