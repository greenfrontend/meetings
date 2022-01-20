# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Events', type: :request do
  fixtures :events

  it 'index' do
    get root_path
    expect(response).to have_http_status(:success)
  end

  it 'new' do
    get new_event_path
    expect(response).to have_http_status(:success)
  end

  it 'create' do
    event = events(:first)
    event_params = { event: { title: event.title, location: event.location, starttime: event.starttime } }

    post events_path, params: event_params
    expect(response).to redirect_to(root_path)
  end

  it 'edit' do
    event = events(:first)
    get edit_event_path event
    expect(response).to have_http_status(:success)
  end

  it 'update' do
    event = events(:first)
    updated_event = { title: 'new' }
    put event_path(event), params: { event: updated_event }
    expect(response).to redirect_to(root_path)
  end

  it 'destroy' do
    delete event_path events(:first)
    expect(response).to redirect_to(root_path)
  end
end
# rubocop:enable Metrics/BlockLength
