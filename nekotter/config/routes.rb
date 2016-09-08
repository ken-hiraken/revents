Rails.application.routes.draw do
  get 'tweets'      =>  'tweets#index'  #ツイート一覧画面
  get 'tweets/new'      =>  'tweets#new'
  post 'tweets'      =>  'tweets#create'
end