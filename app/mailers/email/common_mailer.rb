module Email
  class CommonMailer < ApplicationMailer

    def notify(account_id)
      template_position = account_id.modulo Template.count
      @template = Template.find_by position: template_position

      @account = Auth::Account.find account_id

      account_position = account_id.modulo SmtpAccount.count
      smtp_account = SmtpAccount.find_by position: account_position

      mail_params = {
        to: @account.identity,
        from: "银联信用中心 <#{smtp_account.user_name}>",
        subject: '因你信用分较高，将向你发出提额机 1 部，点击查看（AD）',
        delivery_method_options: {
          user_name: smtp_acount.user_name,
          password: smtp_account.password,
          address: smtp_account.smtp.address
        }
      }

      mail mail_params
    end

  end
end
