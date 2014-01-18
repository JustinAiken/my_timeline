MyTimeline::Engine.routes.draw do
  root to: "events#index"

  resources :events
  resources :posts

  get  "control_panel" => "control_panel#index",    as: "control_panel"
  post "control_panel" => "control_panel#timezone", as: "control_panel_timezone"
end
