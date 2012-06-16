require 'spec_helper'

feature 'Creating a task list', js: true do
  background do
    visit task_lists_path
    click_link 'Create a new task list'
    # TODO handle authentication
  end

  scenario 'creating a task list with no tasks' do
    task_list('Test')
    click_button 'Create Task list'

    page.should have_content('Task list was successfully created')
    page.should have_content('Test')
  end

  scenario 'creating a task list with multiple tasks' do
    task_list('Insertion')
    new_task('selenium')
    new_task('webkit')
    click_button 'Create Task list'

    page.should have_content('selenium')
    page.should have_content('webkit')
  end

  scenario 'removing a task from the task list' do
    task_list('Removal')
    new_task('selenium')
    click_link 'Remove Task'
    click_button 'Create Task list'

    page.should_not have_content('selenium')
  end

  # Grab the last text input field and fill it in with the given task name
  #
  def new_task(task_name)
    click_link 'New task'
    find(:xpath, "(//input[@type='text'])[last()]").set(task_name)
  end

  def task_list(name)
    fill_in 'task_list_name', with: 'Test'
  end
end
