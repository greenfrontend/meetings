# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Admin::SessionsController, type: :controller do
  describe 'POST #create' do
    context 'with valid credentials' do
      let(:admin) { create(:admin) }

      it 'session contains user id' do
        session_params = { sign_in_form: { email: admin.email, password: 'admin' } }
        post :create, params: session_params
        expect(session[:user_id]).to eq admin.id
      end

      it 'redirect to admin area' do
        session_params = { sign_in_form: { email: admin.email, password: 'admin' } }
        post :create, params: session_params
        expect(response).to redirect_to(admin_events_path)
      end
    end

    context 'with invalid credentials' do
      let(:admin) { create(:admin) }

      it 'returns unauthorized status' do
        session_params = { sign_in_form: { email: admin.email, password: 'wrong' } }
        post :create, params: session_params
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroy session' do
      sign_in create(:admin)
      delete :destroy
      expect(session[:user_id]).to eq nil
    end
  end
end
# rubocop:enable Metrics/BlockLength
