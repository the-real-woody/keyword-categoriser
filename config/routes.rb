Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'upload', to: 'upload#upload'
  post 'import', to: 'upload#import'
end
