require 'spec_helper'

feature 'Watching and unwatching task lists' do
  let :user do
    create(:user)
  end

  let :owner do
    create(:user)
  end

  let :first_task_list do
    create(:task_list, name: 't1', owner: owner)
  end

  let :second_task_list do
    create(:task_list, name: 't2', owner: owner)
  end

  background do
    authenticate(user)
  end

  scenario 'Watching a public task list', js: true do
    visit task_list_path(first_task_list)
    click_link 'Watch'

    current_path.should eq watched_task_lists_path
    page.should have_content "You are now watching #{first_task_list.name}"
  end

  scenario 'Unwatching watched task list', js: true do
    visit task_list_path(first_task_list)
    click_link 'Watch'

    visit watched_task_lists_path
    click_link 'Unwatch'

    current_path.should eq watched_task_lists_path
    page.should have_content "You are no longer watching #{first_task_list.name}"
  end

end
