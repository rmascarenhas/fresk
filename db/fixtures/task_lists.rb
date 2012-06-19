1.upto(30) do |n|

  TaskList.seed do |s|
    s.id      = n
    s.user_id = rand(10) + 1
    s.name    = Faker::HipsterIpsum.words(2).join(' ')
    s.public  = rand < 0.8
  end

end
