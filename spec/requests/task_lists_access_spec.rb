require 'spec_helper'

feature 'Task Lists access' do
  let :happy_user do
    create(:user)
  end

  let :task_list do
    create(:task_list, owner: happy_user)
  end

  let :private_task_list do
    create(:private_task_list, owner: happy_user)
  end

  let :sad_user do
    create(:user)
  end

  background do
    authenticate(happy_user)
    happy_user.confirm!
    sad_user.confirm!
  end

  it 'allows access to task lists by its owner' do
    visit task_list_path(task_list)
    page.should have_content task_list.name

    visit task_list_path(private_task_list)
    page.should have_content private_task_list.name
  end

  it 'allows access to public task lists by different users' do
    authenticate(sad_user)
    visit task_list_path(task_list)

    page.should have_content task_list.name
  end

  it 'denies access to private lists by different users' do
    authenticate(sad_user)
    visit task_list_path(private_task_list)

    current_path.should eq not_found_path
  end
end
