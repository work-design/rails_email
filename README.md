# RailsEmail

Email 周边服务

## 功能
* 记录系统邮件发送记录，包含是否发送成功及邮件服务商队列ID等信息；

## 使用方法
* 邮件日志相关配置
* 设置发送邮件返回 response
```ruby
config.action_mailer.smtp_settings = {
  return_response: true
}
```

* 设置邮件发送不成功 raise error，并重发
```ruby
 config.action_mailer.raise_delivery_errors = true
```

访问 `email/admin/logs` 查看邮件发送日志

## 许可证
遵循 [MIT](LICENSE) 协议
