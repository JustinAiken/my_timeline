MyTimeline::Engine.routes.draw do
  root to: "events#index"

  resources :events
  resources :posts

  match "control_panel" => "control_panel#index", as: "control_panel"
end
