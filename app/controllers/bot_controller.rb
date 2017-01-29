

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
 "https://graph.facebook.com/v2.6/me/messages?access_token=#{EAASMK8x5ZBFcBAGtOJEqjHfk7cggpUVnDzLTUaw2wpinVkxzMZANRYfoCVdwZCiMzfx9L0D2fnpjl1SKg8up1gbO6ZC66j6TqAZByNgH8l5cylQqrb46t6He3IXyuQK9rBE7Qp2wDZBi1cMhNJvxsnS52aci7yUYTuF9bdqB3AEQZDZD}",
 body: body,
 headers: { 'Content-Type' => 'application/json' }
)
  
end



end
