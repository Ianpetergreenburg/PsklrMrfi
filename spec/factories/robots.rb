FactoryGirl.define do
  factory :robot do
    height 50
    weight 3
    model_no 'BR_CougarFalcon'
    designation 'Brobot'
    price 50.00
    manufacturer
  end

  factory :pending_robot, class:'Robot' do
    height 50
    weight 3
    model_no 'BR_CougarFalcon'
    designation 'Brobot'
    price 50.00
    manufacturer
    pending true
  end
end
