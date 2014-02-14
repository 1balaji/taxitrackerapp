Tracker::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api do
    post "/:id/logs", to: "logs#logs"
  end
end
