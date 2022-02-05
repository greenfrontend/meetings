# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe EventsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
    create(:user, :admin)
  end

  describe 'GET #index' do
    before { get :index }

    it 'render events list' do
      expect(response).to render_template :index
    end

    it 'returns success status' do
      expect(response).to have_http_status :success
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'renders form' do
      expect(response).to render_template :new
    end

    it 'returns success status' do
      expect(response).to have_http_status :success
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:event) { attributes_for(:event) }

      it 'creates event' do
        event_params = { event: }

        expect do
          post :create, params: event_params
        end.to change(Event, :count).by(1)

        expect(response).to redirect_to(root_path)
      end

      it 'sends email to admins' do
        event_params = { event: }

        expect do
          post :create, params: event_params
        end.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end

    context 'with invalid attributes' do
      it 'not creates event' do
        event_params = { event: { title: 'only title' } }

        expect do
          post :create, params: event_params
        end.not_to change(Event, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET #edit' do
    let(:event) { create(:event, user:) }

    it 'renders edit form' do
      get :edit, params: { id: event.id }
      expect(response).to render_template :edit
    end
  end

  describe 'PUT #update' do
    let(:event) { create(:event, user:) }
    let(:attrs) { Hash[title: 'Event new'] }

    it 'updates event' do
      expect do
        put :update, params: { id: event.id, event: attrs }
      end.to change { event.reload.title }.from('Event').to('Event new')
    end

    it 'redirects to root path' do
      put :update, params: { id: event.id, event: attrs }
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'DELETE #destroy' do
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
