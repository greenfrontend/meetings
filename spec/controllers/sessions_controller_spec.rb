# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    before { get :new }

    it 'renders form' do
      expect(response).to render_template :new
    end

    it 'returns success status' do
      expect(response.status).to eq 200
    end
  end

  describe 'POST #create' do
    context 'with valid credentials' do
      let(:user) { create(:user) }

      it 'session contains user id' do
        session_params = { user: { email: user.email, password: 'test' } }
        post :create, params: session_params
        expect(session[:user_id]).to eq user.id
      end
    end

    context 'with invalid credentials' do
      let(:user) { create(:user) }

      it 'returns unauthorized status' do
        session_params = { user: { email: user.email, password: 'wrong' } }
        post :create, params: session_params
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroy session' do
      sign_in create(:user)
      delete :destroy
      expect(session[:user_id]).to eq nil
    end
  end
end
# rubocop:enable Metrics/BlockLength
