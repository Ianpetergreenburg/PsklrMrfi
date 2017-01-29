FactoryGirl.define do
  factory :admin, class: User do
    first_name "George William"
    last_name "Rutherford IV"
    email "portal_catcher@bsalt.future"
    username "the_commish"
    password "mutantkiller"
    admin true
  end
end

FactoryGirl.define do
  factory :user do
    first_name "Tammy"
    last_name "Tammers"
    email "tammy@tamtam.com"
    username "hello_kitty"
    password "hello"
  end
end
