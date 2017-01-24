# 为什么写这个gem


## 这个gem的工作方式及特性：

1、充分利用rails内置的特性；
2、use Notifications and Subscriber, not rescue_from, 不影响性能;

## 使用方法

add to gemfile，默认包含对controller 及 mailer 的日志记录；
`gem 'rails_log'`

如果只需要其中一个，在gemfile中指定 require

`gem 'rails_log', require: 'log_mailer'`

`gem 'rails_log', require: 'log_controller'`

`gem 'rails_log', require: ['log_controller', 'log_mailer']`

nothing any other to do;

## 注意

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
