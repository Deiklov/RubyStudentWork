Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  root'calc#main'
  get 'calc/main'
  get 'calc/articles'
  get 'calc/work'
  get 'calc/contacts'
  get 'calc/ajax'
  get 'calc/ajaxnoknod'
  get 'calc/sort'
  get 'calc/noknod'
  get 'calc/trigonometric'
  get 'calc/ajaxtrig'
  get 'calc/combinatoric'
  get 'calc/ajaxcomb'
  resources :articles
  devise_for :users
    end
end
