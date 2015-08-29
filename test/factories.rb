FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "doh#{n}@gmail.com"
    end
    password "123123123"
    password_confirmation "123123123"
  end
end
