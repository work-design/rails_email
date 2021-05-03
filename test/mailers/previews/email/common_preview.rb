module Email
  class CommonPreview < ActionMailer::Preview

    def notify
      CommonMailer.notify(Auth::Account.first.id)
    end

  end
end
