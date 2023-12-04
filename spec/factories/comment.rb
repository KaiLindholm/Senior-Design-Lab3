# In spec/factories/comments.rb
FactoryBot.define do
    factory :comment do
      content { Faker::Lorem.sentence }
      page { Faker::Alphanumeric.alpha(number: 3) }
      association :user, factory: :user
  
      # Add any other attributes you have in your Comment model
      # For example, if you have an association with a post, you can do:
      # association :post
    end
  end