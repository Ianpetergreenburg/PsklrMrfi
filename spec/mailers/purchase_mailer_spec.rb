require 'rails_helper'

describe PurchaseMailer do
  describe "purchase mailer" do
    let!(:user) { create(:user) }
    let!(:robot) { create(:robot) }
    let!(:mail ) { PurchaseMailer.purchase_email(user, robot).deliver}

    it "renders the headers" do
      expect(mail.subject).to eq("Congratulations on your new purchase!")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["pugetsoundkarateleague@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include(robot.model_no)
    end
  end
end
