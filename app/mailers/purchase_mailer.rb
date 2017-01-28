class PurchaseMailer < ActionMailer::Base
  default from: 'angroover@gmail.com'
  layout 'purchase_mailer'
  
  def purchase_email(user)
    @user = user

    mail(to: @user.email, subject: "Congratulations on your new purchase!")
  end
end
