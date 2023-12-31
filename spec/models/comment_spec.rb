# spec/models/comment_spec.rb
require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe 'validations' do
    it 'requires content to be present' do
      comment = Comment.new(content: nil, page: 1)
      expect(comment).not_to be_valid
      expect(comment.errors[:content]).to include("can't be blank")
    end

    it 'validates the length of content to be at least 2 characters' do
      comment = Comment.new(content: 'a', page: 1)
      expect(comment).not_to be_valid
      expect(comment.errors[:content]).to include('is too short (minimum is 2 characters)')
    end

    it 'validates the length of content to be at most 140 characters' do
      comment = Comment.new(content: 'a' * 141, page: 1)
      expect(comment).not_to be_valid
      expect(comment.errors[:content]).to include('is too long (maximum is 140 characters)')
    end

    it 'requires page to be present' do
      comment = Comment.new(content: 'Valid content', page: nil)
      expect(comment).not_to be_valid
      expect(comment.errors[:page]).to include("can't be blank")
    end
  end

end
