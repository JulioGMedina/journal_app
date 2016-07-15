require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:comment) { create(:comment) }
  let(:entry) { create(:journal_entry) }
  describe 'POST #create' do
    context 'signed in' do
      before(:each) do
        sign_in create(:user)
      end

      it 'should save valid comment' do
        post :create, comment: { user_id: create(:user).id, journal_entry_id: create(:journal_entry).id, body: 'example' }
        expect(Comment.count).to be(1)
      end

      it 'should redirect after save' do
        post :create, comment: { user_id: create(:user).id, journal_entry_id: entry.id, body: 'example' }
        expect(response).to redirect_to(journal_entry_path(entry.id))
      end
    end

    context 'guest' do
      it 'should redirect guests' do
        post :create
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe 'GET #edit' do
    context 'signed in' do
      before(:each) do
        sign_in create(:user)
      end

      it 'should assign @entry' do
        get :edit, id: comment.id
        expect(assigns(:comment)).to eq(comment)
      end

      it 'should render success status' do
        get :edit, id: comment.id
        expect(response).to have_http_status(:success)
      end
    end
    context 'guest' do
      it 'should redirect guests' do
        get :edit, id: comment.id
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe 'PUT #update' do
    context 'signed in' do
      before(:each) do
        sign_in create(:user)
      end

      it 'should update comments' do
        put :update, id: comment.id, comment: { body: 'updated!'}
        expect(comment.reload.body).to eq('updated!')
      end

      it 'should redirect to journal entry show after update' do
        put :update, id: comment.id, comment: { body: 'updated!'}
        expect(response).to redirect_to(journal_entry_path(comment.journal_entry))
      end
    end

    context 'guest' do
      it 'should redirect guests' do
        put :update, id: comment.id
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'signed in' do
      before(:each) do
        sign_in create(:user)
      end

      it 'should delete comment' do
        delete :destroy, id: comment.id
        expect(Comment.count).to be(0)
      end

      it 'should redirect to journal entry show after destroy' do
        delete :destroy, id: comment.id
        expect(response).to redirect_to(journal_entry_path(comment.journal_entry))
      end
    end

    context 'guest' do
      it 'should redirect guests' do
        delete :destroy, id: comment.id
        expect(response).to have_http_status(:redirect)
        expect(Comment.count).to be(1)

      end
    end
  end
end
