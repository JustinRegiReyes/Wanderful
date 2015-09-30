User.delete_all
Log.delete_all
City.delete_all

50.times do
  user = User.create(
    first_name: FFaker::Name::first_name,
    last_name: FFaker::Name::last_name,
    email: FFaker::Internet::email,
    password: "password",
    current_city: FFaker::Address::city
  )
end

50.times do
  City.create(name: FFaker::Address::city)
end

50.times do
  log = Log.create(
    content:FFaker::HipsterIpsum::paragraph,
    title: FFaker::DizzleIpsum::word,
  )
  random_city = rand(City.count)
  random_user = rand(User.count)
  City.offset(random_city).first.logs << log
  User.offset(random_user).first.logs << log
end
