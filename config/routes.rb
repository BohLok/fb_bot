Rails.application.routes.draw do
  get 'bot/webhook'
  root 'bot#webhook'
 
end
