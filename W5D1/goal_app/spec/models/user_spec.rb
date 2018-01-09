# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.build(:user, username: 'facbot', password: 'password') }

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_uniqueness_of(:username) }
  end

  describe 'instance methods' do
    before { user.save! }
    describe 'password=' do
      it 'should save to database as password_digest' do
        expect(user.password_digest).not_to eq(nil)
      end
    end

    describe 'is_password?' do
      it 'should return true for correct password' do
        expect(user.is_password?('password')).to be true
      end

      it 'should return false for incorrect password' do
        expect(user.is_password?('wrong')).to be false
      end
    end

    describe 'reset_session_token!' do
      it 'should reset user session token' do
        stoken = user.session_token
        user.reset_session_token!
        expect(user.session_token).not_to eq(stoken)
      end
    end
  end

  describe 'class methods' do
    before { user.save! }

    describe '::find_by_credentials' do
      it 'should return the correct user' do
        expect(User.find_by_credentials('facbot', 'password')).to eq(user)
      end

      it 'should return nil for incorrect credentials' do
        expect(User.find_by_credentials('facbot', 'wrong')).to eq(nil)
      end
    end
  end

  describe 'associations' do
    describe 'has_many' do
      it { should have_many(:goals) }
    end
  end
end
