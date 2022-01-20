# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe EventsController, type: :controller do
  fixtures :events

  it 'index' do
    get :index
    expect(response).to have_http_status(:success)
  end

  it 'new' do
    get :new
    expect(response).to have_http_status(:success)
  end

  it 'create' do
    event = events(:first)
    event_params = { event: { title: event.title, location: event.location, start_time: event.start_time } }

    expect do
      post :create, params: event_params
    end.to change(Event, :count).by(1)

    expect(response).to redirect_to(root_path)
  end

  it 'not create' do
    event = events(:first)
    event_params = { event: { title: event.title } }

    expect do
      post :create, params: event_params
    end.not_to change(Event, :count)

    expect(response).to have_http_status(:unprocessable_entity)
  end

  it 'edit' do
    event = events(:first)
    get :edit, params: { id: event.id }
    expect(response).to have_http_status(:success)
  end

  it 'update' do
    event = events(:first)
    updated_event = { title: 'new' }
    put :update, params: { id: event.id, event: updated_event }
    expect(response).to redirect_to(root_path)
  end

  it 'destroy' do
    event = events(:first)

    expect do
      delete :destroy, params: { id: event.id }
    end.to change(Event, :count).by(-1)

    expect(response).to redirect_to(root_path)
  end
end
# rubocop:enable Metrics/BlockLength
