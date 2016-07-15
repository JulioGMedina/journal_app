require 'rails_helper'

RSpec.describe JournalEntry, type: :model do
  let(:journal_entry) { create(:journal_entry) }

  describe 'initialization and validations' do
    it 'should validate presence of user_id' do
      journal_entry.user_id = nil
      expect(journal_entry).to be_invalid
      expect(journal_entry.errors.keys).to include(:user_id)
    end

    it 'should validate presence of content' do
      journal_entry.content = nil
      expect(journal_entry).to be_invalid
      expect(journal_entry.errors.keys).to include(:content)
    end

    it 'should save valid journal_entry' do
      new_entry = build(:journal_entry)
      expect(new_entry).to be_valid
      new_entry.save
      expect(new_entry).to be_persisted
    end
  end
end
