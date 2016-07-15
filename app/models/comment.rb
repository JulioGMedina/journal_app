class Comment < ActiveRecord::Base

  validates :user_id,
            :journal_entry_id,
            :body, presence: true

  belongs_to :user
  belongs_to :journal_entry

end
