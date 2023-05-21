FactoryBot.define do
  factory :subject do
    sequence(:title) { |t| "#{Faker::Science.element_subcategory} #{t}" }

    description { Faker::Lorem.paragraph }
    user
  end
end
