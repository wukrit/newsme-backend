FactoryBot.define do
  factory :user do
    name { "John Doe" }
    username { "jdoe" }
    password { "password" }
    sequence :email do |n|
      "jdoe#{n}@email.com"
    end
  end
end
