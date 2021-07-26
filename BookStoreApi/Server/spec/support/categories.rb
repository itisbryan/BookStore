# frozen_string_literal: true
FactoryBot.define do
  factory :category do
    label { Faker::Book.genre }
    short_description { Faker::Lorem.word }
    is_public { true }

    trait :not_public do
      is_public { false }
    end
  end
end
