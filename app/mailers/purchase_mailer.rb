class PurchaseMailer < ActionMailer::Base
  default from: 'angroover@gmail.com'
  layout 'purchase_mailer'

  def purchase_email(user, purchase)
    @user = user
    @robot = purchase

    mail(to: @user.email, subject: "Congratulations on your new purchase!")
  end
end
