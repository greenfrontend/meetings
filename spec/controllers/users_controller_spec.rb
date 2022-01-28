# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe UsersController, type: :controller do
  it 'new' do
    get :new
    expect(response).to have_http_status(:success)
  end

  context 'when create user' do
    let(:user) do
      attributes_for(:user, password: '123',
                            password_confirmation: '123')
    end

    it 'create' do
      users_params = { user: }

      expect do
        post :create, params: users_params
      end.to change(User, :count).by(1)

      expect(response).to redirect_to('/session/new')
    end
  end

  context 'when not create user' do
    let(:user) do
      attributes_for(:user, password: '123',
                            password_confirmation: '456')
    end

    it 'not create' do
      users_params = { user: }

      expect do
        post :create, params: users_params
      end.not_to change(User, :count)

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
# rubocop:enable Metrics/BlockLength
