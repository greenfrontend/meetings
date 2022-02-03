# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Admin::EventsController, type: :controller do
  let(:user) { create(:user) }
  let(:admin) { create(:user, :admin) }

  before do
    sign_in admin
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
      expect(response).to redirect_to(admin_events_path)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroy' do
      event = create(:event, user:)

      expect do
        delete :destroy, params: { id: event.id }
      end.to change(Event, :count).by(-1)

      expect(response).to redirect_to(admin_events_path)
    end
  end
end
# rubocop:enable Metrics/BlockLength
