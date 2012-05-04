Facessook::Application.routes.draw do
  root to: 'cybersquatting#index'
  get '/how_much' => 'cybersquatting#how_much'
  get '/to_facebook' => 'cybersquatting#to_facebook'

  # wildcard
  get '/*wildcard' => 'cybersquatting#index'
end
