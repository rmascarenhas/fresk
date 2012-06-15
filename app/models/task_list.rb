class TaskList < ActiveRecord::Base
  attr_accessible :name

  validates :name,
            presence: true

  # List task lists in the order they were last updated
  default_scope order('updated_at DESC')

  # Indicates whether or not this is a private task list
  #
  def private?
    !self.public
  end
end
