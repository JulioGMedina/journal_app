class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
            :email, uniqueness: { case_sensitive: false }

  validates :username,
            :email, presence: true

end
