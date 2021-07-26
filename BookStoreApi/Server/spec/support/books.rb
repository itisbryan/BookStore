FactoryBot.define do
  factory :book do
    isbn { Faker::Barcode.isbn   }
    title { Faker::Book.title }
    short_description { Faker::Lorem.word }
    published_year { 2021 }
    publisher { Faker::Book.publisher }
    author_name { Faker::Name.name }
    price { 10.20 }

    user { create(:user) }
    category { create(:category) }
  end
end
