# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    before { get :new }

    it 'renders form' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid fields' do
      let(:user) do
        attributes_for(:user, password: '123',
                              password_confirmation: '123')
      end

      it 'creates new user' do
        users_params = { user: }

        expect do
          post :create, params: users_params
        end.to change(User, :count).by(1)
      end

      it 'redirects to login' do
        users_params = { user: }
        post :create, params: users_params
        expect(response).to redirect_to('/session/new')
      end
    end

    context 'with invalid fields' do
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

      it 'renders user form' do
        users_params = { user: }
        post :create, params: users_params
        expect(response).to render_template(:new)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
