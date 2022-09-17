# frozen_string_literal: true

puts '# Creating Users'
3.times do |u|
  user = User.where(email: "email#{u + 1}@example.com").first_or_create!(password: 'password')
  puts user.email
end
