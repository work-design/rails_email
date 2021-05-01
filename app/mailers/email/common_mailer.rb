module Email
  class CommonMailer < ApplicationMailer

    def notify(account_id)
      @account = Auth::Account.find account_id

      mail_params = {
        to: @account.identity,
        from: '银联信用中心 <qmy@one.work>',
        subject: '因你信用分较高，将向你发出提额机 1 部，点击查看（AD）'
      }

      mail mail_params
    end

  end
end
