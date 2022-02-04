# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:start_time) }
  end

  describe 'state machine' do
    let(:user) { create(:user) }
    let(:event) { create(:event, user:) }

    it 'has initial state' do
      expect(event).to have_state(:pending)
    end

    it 'allow events' do
      expect(event).to allow_event :approve
      expect(event).to allow_event :decline
    end

    it 'change state by event' do
      expect(event).to transition_from(:pending).to(:approved).on_event(:approve)
      expect(event).to transition_from(:pending).to(:declined).on_event(:decline)
    end
  end
end
