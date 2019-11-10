module WechatWorkBot
  extend self

  def send(msg)
    url = RailsLog.config.notify_url
    body = msg.as_markdown
  
    HTTPX.post(url, json: body)
  end

end
