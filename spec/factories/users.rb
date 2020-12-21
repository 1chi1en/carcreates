FactoryBot.define do
  factory :user do
    nickname				{"amiso"}
    email					{"kkk@gmail.com"}
    password				{"000000"}
    password_confirmation	{password}
  end
end