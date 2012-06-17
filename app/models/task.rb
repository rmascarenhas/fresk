class Task < ActiveRecord::Base
  belongs_to :task_list,
             counter_cache: true

  attr_accessible :deadline, :description, :finished

  validates :description,
            presence: true,
            uniqueness: { scope: :task_list_id },
            length: { maximum: 140 }

  validates :deadline,
            presence: true


  # A task is expired if its deadline has already passed.
  #
  def expired?
    Time.now > self.deadline
  end
end
