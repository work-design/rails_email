module WechatWorkBot
  extend self

  def send_message(msg)
    url = RailsLog.config.notify_url
    body = msg.as_markdown
  
    HTTPX.post(url, json: body)
  end

end
