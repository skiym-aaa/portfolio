class ThanksMailer < ActionMailer::Base
  default from: "idol_places@gmail.com"

  def send_confirm_to_user(user)
    @user = user
    mail(
      subject: "会員登録が完了しました。", #メールのタイトル
      to: @user.email #宛先
    ) do |format|
      format.text
      end
  end
end
