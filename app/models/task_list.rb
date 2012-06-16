class TaskList < ActiveRecord::Base
  # We can allow the `public' attribute to be mass-assigned since
  # task list creation is protected by an authentication filter.
  #
  attr_accessible :name, :public

  has_many :tasks,
           order: 'deadline DESC',
           dependent: :destroy

  accepts_nested_attributes_for :tasks

  attr_readonly :tasks_count

  validates :name,
            presence: true
            # uniqueness: true, scope: user_id

  # List task lists in the order they were last updated
  #
  default_scope order('updated_at DESC')

  # Indicates whether or not this is a private task list
  #
  def private?
    !self.public
  end
end
