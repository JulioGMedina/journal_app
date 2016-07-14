require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  describe 'Initialization and validation' do
    it 'should validate uniqueness of email' do
      invalid_user = User.new(email: user.email)
      expect(invalid_user).to be_invalid
    end

    it 'should validate uniqueness of username' do
      invalid_user = User.new(username: user.username)
      expect(invalid_user).to be_invalid
    end

    it 'should validate presence of email' do
      user.email = ''
      expect(user).to be_invalid
    end

    it 'should validate presence of username' do
      user.username = ''
      expect(user).to be_invalid
    end

    it 'should save valid user' do
      new_user = create(:user)
      expect(new_user).to be_valid
      new_user.save
      expect(new_user).to be_persisted
    end
  end
end
