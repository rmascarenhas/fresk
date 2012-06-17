class TaskList < ActiveRecord::Base
  # We can allow the `public' attribute to be mass-assigned since
  # task list creation is protected by an authentication filter.
  #
  attr_accessible :name, :public, :tasks_attributes

  belongs_to :owner,
             class_name: 'User',
             foreign_key: :user_id,
             counter_cache: true

  has_many :tasks,
           order: 'deadline',
           dependent: :destroy

  accepts_nested_attributes_for :tasks, allow_destroy: true

  attr_readonly :tasks_count

  validates :name,
            presence: true,
            uniqueness: { scope: :user_id }

  # List task lists in the order they were last updated
  #
  default_scope order('updated_at DESC')

  # Indicates whether or not this is a private task list
  #
  def private?
    !self.public
  end
end
