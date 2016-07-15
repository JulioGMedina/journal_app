require 'rails_helper'

RSpec.describe JournalEntriesController, type: :controller do
  let(:entry) { create(:journal_entry) }

  describe 'GET #show' do
    context 'signed in' do
      before(:each) do
        sign_in create(:user)
      end

      it 'should assign @entry' do
        get :show, id: entry.id
        expect(assigns(:entry)).to eq(entry)
      end

      it 'should return success status' do
        get :show, id: entry.id
        expect(response).to have_http_status(:success)
      end
    end

    context 'guest' do
      it 'should redirect guests' do
        get :show, id: entry.id
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
