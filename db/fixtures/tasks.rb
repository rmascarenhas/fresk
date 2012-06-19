1.upto(100) do |n|

  Task.seed do |s|
    s.id = n
    s.task_list_id = rand(30) + 1
    s.description = Faker::Lorem.words.join(' ')
    s.deadline = rand(12).days.from_now
  end

end
