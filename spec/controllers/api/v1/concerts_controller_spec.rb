require 'rails_helper'

describe Api::V1::ConcertsController do
  # GET /api/v1/concerts
  describe 'GET #index' do
    subject(:http_request) { get :index }

    let!(:concert) { create_list(:concert, 3) }

    before do
      http_request
    end

    it 'responds with ok status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'validat count response' do
      expect(JSON(response.body).count).to be 3
    end
  end

  # POST /api/v1/concerts + Key
  describe 'POST #create' do
    subject(:http_request) { post :create, params: params }

    let(:params) do
      {
        concert: {
          name: 'Arjona',
          city: 'Medellin'
        }
      }
    end

    context 'when user not logged in' do
      before { http_request }

      it 'responds with unauthorized status code' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when user is are logged in' do
      # TODO: user login, for get http request

      #   include_context 'authenticated user'

      #   before { http_request }

      #   it 'responds with created status code' do
      #     expect(response).to have_http_status(:created)
      #   end
    end
  end
end
