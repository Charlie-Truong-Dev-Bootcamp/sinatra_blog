require 'faker'

5.times{
  Tag.create(name: Faker::Lorem.word)
}

10.times{
  Post.create(title: Faker::Lorem.sentence, body: (Faker::Lorem.paragraphs + Faker::Lorem.paragraphs).join("\n"), author: Faker::Name.name)
}


Post.all.each do |post|
    rand(1..3).times{TagLink.create(tag_id: rand(1..5), post_id: post.id)}
end
