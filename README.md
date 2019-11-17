# RailsLog

## 功能
1. 记录Rails应用报错日志到数据库中，包含出错时的各种详尽信息。
2. 记录系统邮件发送记录，包含是否发送成功及邮件服务商队列ID等信息。
3. 在开发环境中（Loglevel 为 debug）,打印request headers 信息：

```
Started GET "/admin/log_csps" for 127.0.0.1 at 2018-11-06 15:11:45 +0800
Processing by Log::Admin::LogCspsController#index as HTML
  Headers: {"ACCEPT"=>"text/html, application/xhtml+xml", "ACCEPT_ENCODING"=>"gzip, deflate, br", "ACCEPT_LANGUAGE"=>"en,zh-CN;q=0.9,zh;q=0.8,en-US;q=0.7,zh-TW;q=0.6", "CONNECTION"=>"keep-alive", "HOST"=>"localhost:3000", "IF_NONE_MATCH"=>"W/\"0b91528b7e1207b8a0c59f74361bbb16\"", "REFERER"=>"http://localhost:3000/admin/log_mailers", "TURBOLINKS_CSP_NONCE"=>"usxcEjOGjTjPfcGLmodktA==", "TURBOLINKS_REFERRER"=>"http://localhost:3000/admin/log_mailers", "USER_AGENT"=>"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36", "UTC_OFFSET"=>"-480", "VERSION"=>"HTTP/1.1"}
```
4. 为内容安全策略提供 report url
5. 支持企业微信机器人发送通知

## 特性
1. 注重性能：使用订阅通知机制实现，而非`rescue_from` 或者 `Rack middleware`;
2. 记录了非常详尽的debug信息;

## 使用方法

1. 添加到gemfile中，默认包含对controller 及 mailer 的日志记录；
`gem 'rails_log'`

如果只需要其中一个，在gemfile中指定 require
```
gem 'rails_log', require: 'log_mailer'
gem 'rails_log', require: 'log_controller'
gem 'rails_log', require: ['log_controller', 'log_mailer']
```

2. 运行迁移
```ruby
rake rails_log_engine:install:migrations # 为Rails Engine默认提供的方法
```

3. 邮件日志相关配置
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

## License
License 采用 [LGPL-3.0](https://opensource.org/licenses/LGPL-3.0).
