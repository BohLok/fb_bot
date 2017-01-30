

class BotController < ApplicationController



 def webhook
 #  if params['hub.verify_token'] == 'token_Vidjr?'
     render text: params['hub.challenge'] and return
 #  else
 #    render text: 'error' and return
#   end
  end

def receive_message
 if params[:entry]
   messaging_events = params[:entry][0][:messaging]
     messaging_events.each do |event|
     sender = event[:sender][:id]
     if (text = event[:message] && event[:message][:text])
        send_text_message(sender, "Hi there! You said:. The Bots")
     end
   end
 end

 render nothing: true
end

def send_text_message
body = {
 recipient: {
   id: sender
 },
 message: {
   text: text
 }
}.to_json
response = HTTParty.post(
 "https://graph.facebook.com/v2.6/me/messages?access_token=#{ENV[fb_access_token]}",
 body: body,
 headers: { 'Content-Type' => 'application/json' }
)
  
end



end
