FactoryBot.define do
  factory :comment do
    content { "MyText" }
    page { "MyString" }
    user { nil }
  end
end
