class JournalEntry < ActiveRecord::Base

  validates :user_id,
            :content, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
end
