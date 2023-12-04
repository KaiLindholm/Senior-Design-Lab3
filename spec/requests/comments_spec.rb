require 'rails_helper'

RSpec.describe CommentsController, type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:comment) { FactoryBot.create(:comment, user: user) }

  describe 'GET #show' do
    it 'assigns the requested comment to @comments' do
      get comments_path(comment)
      expect(assigns(:comments)).to eq(comment)
    end
  end

  describe 'POST #create' do
    context 'when user is signed in' do
      before { sign_in_user(user) }

      context 'with valid parameters' do
        it 'creates a new comment' do
          post comments_path, comment: FactoryBot.attributes_for(:comment)
          expect(response).to have_http_status(:redirect)
          expect(Comment.count).to eq(1)
        end
      end

      context 'with invalid parameters' do
        it 'does not create a new comment' do
          post comments_path, comment: { content: nil }
          expect(response).to have_http_status(:unprocessable_entity)
          expect(Comment.count).to eq(0)
        end
      end
    end

    context 'when user is not signed in' do
      it 'redirects to the sign-in page' do
        post comments_path, params: { comment: FactoryBot.attributes_for(:comment) }
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when user is signed in' do
      before { sign_in_user(user) }

      context 'when user is the owner of the comment' do
        it 'destroys the requested comment' do
          delete comment_path(comment)
          expect(response).to have_http_status(:redirect)
          expect(Comment.count).to eq(0)
        end
      end

      context 'when user is not the owner of the comment' do
        it 'does not destroy the comment' do
          another_user = FactoryBot.create(:user)
          another_comment = FactoryBot.create(:comment, user: another_user)
          delete comment_path(another_comment)
          expect(response).to redirect_to(:back)
          expect(Comment.count).to eq(1)
        end
      end
    end

    context 'when user is not signed in' do
      it 'redirects to the sign-in page' do
        delete comment_path(comment)
        expect(response).to redirect_to(new_session_path)
      end
    end
  end
end
