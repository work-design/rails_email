# RailsLog


## Features

1. use Notifications and Subscriber, not rescue_from, not Rack middleware, No affect on Performance;
2. 记录了非常详尽的debug信息。

## 使用方法

add to gemfile，默认包含对controller 及 mailer 的日志记录；
`gem 'rails_log'`

如果只需要其中一个，在gemfile中指定 require

`gem 'rails_log', require: 'log_mailer'`

`gem 'rails_log', require: 'log_controller'`

`gem 'rails_log', require: ['log_controller', 'log_mailer']`

nothing any other to do;

### 注意

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


## 依赖
* [rails_com](https://github.com/qinmingyuan/rails_com) 一个通用的engine
* [default_where](https://github.com/qinmingyuan/default_where) 用于处理查询