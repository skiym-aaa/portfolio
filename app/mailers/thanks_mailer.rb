class ThanksMailer < ApplicationMailer
  default from: 'idolplaces@gmail.com'

  def send_confirm_to_user(user)
    @user = user
    mail(
      subject: '会員登録が完了しました。', # メールのタイトル
      to: @user.email, &:text # 宛先
    )
  end
end
