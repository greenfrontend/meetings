# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventService do
  before do
    Sidekiq::Testing.fake!
    create(:user, :admin)
  end

  context 'when EventService is called' do
    let(:event) { create(:event) }

    it 'creates SendEventCreatedMailJob' do
      expect do
        described_class.notify_admins_on_create_event(event)
      end.to change(SendEventCreatedMailJob.jobs, :size).by(1)
    end
  end
end
