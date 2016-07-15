require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    5.times { create(:user) }
  end

  describe 'GET #index' do
    context 'signed in' do
      before(:each) do
        sign_in create(:user)
      end

      it 'should assign @users' do
        get :index
        expect(assigns(:users)).to eq(User.all)
      end

      it 'should return success status' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context 'guest' do
      it 'should redirect guests' do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
