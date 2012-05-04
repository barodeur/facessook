Facessook::Application.routes.draw do
  root to: 'cybersquatting#index'
  #get '/**' => 'cybersquatting#index'
  get '/how_much' => 'cybersquatting#how_much'
end
