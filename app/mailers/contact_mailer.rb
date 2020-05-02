class ContactMailer < ApplicationMailer
  default to: 'idolplaces@gmail.com' # 送信先アドレス

  def received_email(message)
    @message = message
    mail(subject: 'webサイトよりメッセージが届きました', &:text)
  end
end
