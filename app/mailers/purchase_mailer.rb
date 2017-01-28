class PurchaseMailer < ActionMailer::Base
  default to : 'angroover@gmail.com'
  def purchase_email(name, email, body)
    @name = name
    @email = email
    @body = body

    mail(to:email, subject: "Congratulations on your new purchase!")
  end
end
