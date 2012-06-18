require 'accessible'

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

  # A task list is responsible for knowning if it can be visited or watched
  # by a particular user.
  #
  def can_be_visited_by?(user)
    visit_rules.apply(user, self)
  end

  def can_be_watched_by?(user)
    watch_rules.apply(user, self)
  end

  private

  def visit_rules
    @visit_rules ||= initialize_visit_rules
  end

  def watch_rules
    @watch_rules ||= initialize_watch_rules
  end

  def initialize_visit_rules
    rules = Accessible::Rules.new
    rules.add do |user, task_list|
      task_list.owner == user || task_list.public?
    end
  end

  def initialize_watch_rules
    rules = Accessible::Rules.new
    rules.add do |user, task_list|
      task_list.owner != owner && task_list.public?
    end
  end
end
