module WechatWorkBot
  extend self

  def send(msg)
    url = RailsLog.config.notify_url
    body = msg.as_markdown
    headers = {
      'Content-Type': 'application/json'
    }
  
    HTTParty.post(url, body: body, headers: headers)
  end

end
