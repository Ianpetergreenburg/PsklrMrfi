FactoryGirl.define do
  factory :admin, class: User do
    username "the_commish"
    password "mutantkiller"
  end
end

FactoryGirl.define do
  factory :user do
    first_name "Tammy"
    last_name "Tammers"
    email "tammy@tamtam.com"
    username "hello_kitty"
    password "hello"
    payment_info 4444123456789999
  end
end
