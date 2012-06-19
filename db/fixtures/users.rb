ActionMailer::Base.delivery_method = :test

1.upto(10) do |n|

  AVATARS = Dir["#{Rails.root}/spec/assets/*.jpg"]

  User.seed do |s|
    s.id       = n
    s.name     = Faker::Name.name
    s.email    = Faker::Internet.email
    s.username = Faker::Internet.user_name
    s.password = 'password'
    s.avatar   = File.open(AVATARS[rand(AVATARS.size)])
  end

end
