Rails.application.routes.draw do
  #get 'bot/webhook'
  root 'bot#webhook'
  
 get 'bot/webhook' => 'bot#webhook'
 post 'bot/webhook' => 'bot#receive_message'
 
end
