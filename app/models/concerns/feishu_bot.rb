class FeishuBot < LogRecordBot

  def send_message
    url = "https://open.feishu.cn/open-apis/bot/hook/#{RailsLog.config.notify_key}"
    HTTPX.post(url, json: body)
  end

  def body
    {
      title: '收到错误通知',
      text: content
    }
  end

end
