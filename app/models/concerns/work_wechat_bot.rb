class WorkWechatBot < LogRecordBot

  def send_message
    url = "https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=#{RailsLog.config.notify_key}"
    HTTPX.post(url, json: body)
  end

  def body
    {
      msgtype: 'markdown',
      markdown: {
        content: content
      }
    }
  end

end
