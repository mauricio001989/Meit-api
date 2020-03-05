require 'rails_helper'

describe Api::V1::UsersController do
  # POST /api/v1/concerts
  describe 'POST #create' do
    subject(:http_request) { post :create, params: params }

    let(:params) do
      {
        user: {
          name: 'GTdaa oo',
          email: 'Gtdaaoo@starwars.com',
          password: '12345678',
          password_confirmation: '12345678'
        }
      }
    end

    context 'when user is are logged in' do
      before { http_request }

      it 'responds with created status code' do
        expect(response).to have_http_status(:created)
      end

      it 'validate in databse' do
        expect(User.last.email).to eq('gtdaaoo@starwars.com')
      end
    end
  end

  # GET /api/v1/users/user + Key
  describe 'GET #show' do
    subject(:http_request) { get :show }

    context 'when user is log0)ged in' do
      let!(:user) { create(:user) }
      include_context 'logger user'

      before do
        http_request
      end

      context 'validate state code' do
        it 'white responds ok' do
          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
end
