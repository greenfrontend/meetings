# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe EventsController, type: :controller do
  context 'with logined user' do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    it 'index' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'new' do
      get :new
      expect(response).to have_http_status(:success)
    end

    context 'when create event' do
      let(:event) { attributes_for(:event) }

      it 'create' do
        event_params = { event: }

        expect do
          post :create, params: event_params
        end.to change(Event, :count).by(1)

        expect(response).to redirect_to(root_path)
      end
    end

    context 'when not creates' do
      it 'not create' do
        event_params = { event: { title: 'only title' } }

        expect do
          post :create, params: event_params
        end.not_to change(Event, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    it 'edit' do
      event = create(:event, user:)
      get :edit, params: { id: event.id }
      expect(response).to have_http_status(:success)
    end

    it 'update' do
      event = create(:event, user:)
      put :update, params: { id: event.id, event: { title: 'new' } }
      expect(response).to redirect_to(root_path)
    end

    it 'destroy' do
      event = create(:event, user:)

      expect do
        delete :destroy, params: { id: event.id }
      end.to change(Event, :count).by(-1)

      expect(response).to redirect_to(root_path)
    end
  end
end
# rubocop:enable Metrics/BlockLength
