# frozen_string_literal: true

puts '# Creating Users'
3.times do |u|
  user = FactoryBot.create(:user)
  puts user.email
end

6.times do |s|
  subject = FactoryBot.create(:subject)
  puts subject.title
end
