FactoryBot.define do
  factory :user do
    name { "John Doe" }
    username { "jdoe" }
    email { "jdoe@email.com" }
    password { "password" }
  end
end