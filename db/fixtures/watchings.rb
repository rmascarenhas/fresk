1.upto(50) do |n|

  Watching.seed do |s|
    s.id = n
    s.user_id = rand(10) + 1
    s.task_list_id = rand(30) + 1
  end

end
