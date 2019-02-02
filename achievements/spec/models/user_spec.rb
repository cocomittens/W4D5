require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:test_user) {FactoryBot.build(:user)}
#validations
    describe 'validations' do
        it {should validate_presence_of(:username)}
        it {should validate_presence_of(:password_digest)}
        it {should validate_length_of(:password).is_at_least(6)}
        it {should validate_uniqueness_of(:username)}
    end

#associations

#class scope methods
  describe 'class scope methods' do
   
      it "returns the user" do
          user1 = User.create(username: 'mittens', password: '123456')
          expect(User.find_by_credentials('mittens', '123456')).to eq(user1)
      end

      it 'resets the session token' do
        expect(test_user.reset_session_token!).to eq(test_user.session_token)
      end

      it 'ensures the session token' do
        expect(test_user.ensure_session_token).to_not be_nil
      end

      it 'validates the password' do
        expect(test_user.is_password?(test_user.password)).to be_truthy
      end
  end


end


