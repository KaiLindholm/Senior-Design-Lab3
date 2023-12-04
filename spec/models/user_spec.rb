# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'requires name to be present' do
      user = User.new(name: nil)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'validates the length of name to be at most 25 characters' do
      user = User.new(name: 'a' * 26)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include('is too long (maximum is 25 characters)')
    end

    it 'requires email to be present' do
      user = User.new(email: nil)
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'validates uniqueness of email (case-insensitive)' do
      existing_user = create(:user, email: 'test@example.com')
      user = User.new(email: existing_user.email.upcase)
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include('has already been taken')
    end

    it 'validates the format of email' do
      user = User.new(email: 'invalid_email')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include('is invalid')
    end

    it 'requires password to be present' do
      user = User.new(password: nil)
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'validates the length of password to be at least 6 characters' do
      user = User.new(password: '12345')
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    it 'requires password_confirmation to be present' do
      user = User.new(password_confirmation: nil)
      expect(user).not_to be_valid
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end
  end

  describe 'has_secure_password' do
    let(:user) { create(:user, password: 'password123', password_confirmation: 'password123') }

    it 'is authenticated with correct password' do
      expect(user.authenticate('password123')).to be_truthy
    end

    it 'is not authenticated with incorrect password' do
      expect(user.authenticate('wrongpassword')).to be_falsey
    end
  end
end



