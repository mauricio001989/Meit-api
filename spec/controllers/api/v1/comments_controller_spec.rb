require 'rails_helper'

describe Api::V1::CommentsController do
  # GET /api/v1/comments + Key
  describe 'GET #index' do
    subject(:http_request) { get :index }

    let!(:comment) { create_list(:comment, 3) }

    context 'when user not logged in' do
      before { http_request }

      it 'responds with unauthorized status code' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when user is logged in' do
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

  # POST /api/v1/concerts + Key
  describe 'POST #create' do
    subject(:http_request) { post :create, params: params }
    let(:concert) { create(:concert) }
    let(:user) { create(:user) }
    let(:params) do
      {
        comment: {
          concert_id: concert.id,
          user_id: user.id,
          comment: 'comentario sobre el evento'
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
      let!(:user) { create(:user) }
      include_context 'logger user'

      before { http_request }

      it 'responds with created status code' do
        expect(response).to have_http_status(:created)
      end
    end
  end
end
