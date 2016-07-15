require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { create(:comment) }
  describe 'initialization and validations' do
    it 'should validate presence of user_id' do
      comment.user_id = nil
      expect(comment).to be_invalid
      expect(comment.errors.keys).to include(:user_id)
    end

    it 'should validate presence of journal_entry_id' do
      comment.journal_entry_id = nil
      expect(comment).to be_invalid
      expect(comment.errors.keys).to include(:journal_entry_id)
    end

    it 'should validate presence of body' do
      comment.body = nil
      expect(comment).to be_invalid
      expect(comment.errors.keys).to include(:body)
    end

    it 'should save valid comment' do
      new_comment = build(:comment)
      new_comment.save
      expect(new_comment).to be_valid
      expect(new_comment).to be_persisted
    end
  end
end
