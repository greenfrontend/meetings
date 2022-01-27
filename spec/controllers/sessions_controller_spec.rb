# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  it 'new' do
    get :new
    expect(response).to have_http_status(:success)
  end

  context 'when logged in' do
    let(:user) { create(:user) }

    it 'session contains user id' do
      session_params = { user: { email: user.email, password: 'test' } }

      post :create, params: session_params

      expect(session[:user_id]).to eq user.id
    end
  end

  context 'when not logged in' do
    let(:user) { create(:user) }

    it 'session not contains user id' do
      session_params = { user: { email: user.email, password: 'wrong' } }

      post :create, params: session_params

      expect(response).to have_http_status(:unauthorized)
    end
  end

  it 'destroy' do
    sign_in create(:user)

    delete :destroy

    expect(session[:user_id]).to eq nil
  end
end
