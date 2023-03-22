FactoryBot.define do
  factory :subject do
    title { Faker::Science.element_subcategory }
    description { Faker::Lorem.paragraph }
    user
  end
end
