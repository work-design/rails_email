# RailsEmail

Email 周边服务

## 功能
2. 记录系统邮件发送记录，包含是否发送成功及邮件服务商队列ID等信息；


## 特性
1. 注重性能：使用订阅通知机制实现，而非`rescue_from` 或者 `Rack middleware`;
2. 记录了非常详尽的debug信息;

## 使用方法

* 添加到gemfile中，默认包含对controller 及 mailer 的日志记录；
`gem 'rails_log'`

如果只需要其中一个，在gemfile中指定 require
```
gem 'rails_log', require: 'log_mailer'
gem 'rails_log', require: 'log_controller'
gem 'rails_log', require: ['log_controller', 'log_mailer']
```

* 邮件日志相关配置
* 设置发送邮件返回 response
```ruby
config.action_mailer.smtp_settings = {
  return_response: true
}
```

* 设置邮件发送不成功raise error，并重发
```ruby
 config.action_mailer.raise_delivery_errors = true
```

then you can visit `log_records` to see error records

## 许可证
许可证采用 [LGPL-3.0](https://opensource.org/licenses/LGPL-3.0)
