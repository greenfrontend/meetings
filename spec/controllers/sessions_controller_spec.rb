# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe SessionsController, type: :controller do
  fixtures :users

  it 'new' do
    get :new
    expect(response).to have_http_status(:success)
  end

  it 'create' do
    session_params = {
      user: {
        email: users(:test).email,
        password: 'test'
      }
    }

    post :create, params: session_params

    expect(session[:user_id]).to eq users(:test).id
  end

  it 'not create' do
    session_params = {
      user: {
        email: users(:test).email,
        password: 'wrong'
      }
    }

    post :create, params: session_params

    expect(response).to have_http_status(:unauthorized)
  end

  it 'destroy' do
    sign_in users(:test)

    delete :destroy

    expect(session[:user_id]).to eq nil
  end
end
# rubocop:enable Metrics/BlockLength
