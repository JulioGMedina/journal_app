require 'rails_helper'

RSpec.describe UserJournalEntriesController, type: :controller do
  let(:entry_params) { {journal_entry: { content: 'Entry content'}} }
  let(:entry) { @user.journal_entries.last }

  before(:each) do
    @user = create(:user)
    5.times { create(:journal_entry, user: @user) }
    @request.env["devise.mapping"] = Devise.mappings[:admin]
  end

  describe 'GET #index' do
    context 'signed in' do
      before(:each) do
        sign_in @user
      end
      it 'should retrieve all users entries' do
        get :index, user_id: @user.id

        expect(assigns(:entries).count).to be(5)
        expect(response).to have_http_status(:success)
      end
    end

    context 'guest' do
      it 'should redirect guests' do
        get :index, user_id: @user.id
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe 'GET #new' do
    context 'signed in' do
      context 'signed in' do
        before(:each) do
          sign_in @user
        end

        it 'should assign @entry' do
          get :new, user_id: @user.id
          expect(assigns(:entry)).to be_a(JournalEntry)
          expect(response).to have_http_status(:success)
        end
      end

      context 'guest' do
        it 'should redirect guests' do
          get :index, user_id: @user.id
          expect(response).to have_http_status(:redirect)
        end
      end
    end
  end

  describe 'POST #index' do
    context 'signed in' do
      before(:each) do
        sign_in @user
      end

      it 'should create journal entry' do
        post :create, {user_id: @user.id, entry: { content: 'entry content' }}

        expect(@user.journal_entries.count).to be(6)
        expect(response).to have_http_status(:redirect)
      end

      it 'should render #new if cannot save' do
        post :create, {user_id: @user.id, entry: { content: '' }}
        expect(response).to render_template(:new)
      end
    end

    context 'guest' do
      it 'should redirect guests' do
        post :create, user_id: @user.id
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe 'GET #edit' do
    context 'signed in' do
      before(:each) do
        sign_in @user
      end

      it 'should assign @entry' do
        get :edit, user_id: @user.id, id: entry.id

        expect(assigns(:entry)).to eq(entry)
        expect(response).to have_http_status(:success)
      end
    end

    context 'guest' do
      it 'should redirect guests' do
        get :edit, user_id: @user.id, id: entry.id
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe 'PUT #update' do
    context 'signed in' do
      before(:each) do
        sign_in @user
      end

      it 'should update if valid' do
        put :update, user_id: @user.id, id: entry.id, entry: { content: 'new content' }
        expect(entry.reload.content).to eq('new content')
      end

      it 'should assign @entry' do
        put :update, user_id: @user.id, id: entry.id, entry: { content: 'new content' }
        expect(assigns(:entry)).to eq(entry)
      end
    end

    context 'guest' do
      it 'should redirect guests' do
        put :update, user_id: @user.id, id: entry.id, entry: { content: 'new content' }
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'signed in' do
      before(:each) do
        sign_in @user
      end

      it 'should delete entry' do
        delete :destroy, user_id: @user.id, id: entry.id
        expect(@user.journal_entries.count).to be(4)
      end

      it 'should redirect on delete' do
        delete :destroy, user_id: @user.id, id: entry.id
        expect(response).to redirect_to(user_journal_entries_path(@user))
      end
    end
    context 'guest' do
      it 'should redirect guests' do
        delete :destroy, user_id: @user.id, id: entry.id
        expect(@user.journal_entries.count).to be(5)
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
