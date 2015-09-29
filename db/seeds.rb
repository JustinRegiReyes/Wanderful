

require 'ffaker'

User.delete_all
Post.delete_all
City.delete_all

50.times do ||
  User.create( first_name: FFaker::Name::first_name,
   last_name: FFaker::Name::last_name,
   email: FFaker::Internet::email,
   password: "password",
   current_city: FFaker::Address::city
    )

  end

50.times do ||
  City.create( name: FFaker::Address::city)
end

50.times do ||
  post = Post.create( user_id: rand(1 .. 50),
      content:FFaker::HipsterIpsum::paragraph,
      title: FFaker::DizzleIpsum::word,
      )
  City.find_by_id(rand(1 .. 50)).posts << post
end


