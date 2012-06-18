class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :omniauthable
  #
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable


  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :username, :avatar, :remote_avatar_url, :avatar_cache, :login

  attr_readonly :task_lists_count

  # Virtual attribute allowing authentication via username or email
  #
  attr_accessor :login

  mount_uploader :avatar, AvatarUploader

  validates :name,
            presence: true

  validates :email,
            presence: true,
            uniqueness: true

  validates :username,
            presence: true,
            uniqueness: true

  validates :avatar,
            presence: true


  has_many :task_lists,
           order: 'updated_at',
           dependent: :destroy

  # Override Devise's database authentication method in order to provide login
  # by username or email
  #
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where('username = :login OR lower(email) = :login', login: login).first
    else
      where(conditions).first
    end
  end
end
