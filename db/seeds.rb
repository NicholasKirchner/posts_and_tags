require 'faker'

20.times do
  Post.create(title: Faker::Lorem.sentence,
              content: Faker::Lorem.paragraphs)
  Tag.create(name: Faker::Lorem.word)
end

p = 0.3

Post.all.each do |post|
  Tag.all.each do |tag|
    post.tags << tag if rand() < p
  end
  post.save
end
