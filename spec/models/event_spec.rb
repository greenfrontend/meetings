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

    it { is_expected.to have_state :pending }

    it { is_expected.to allow_event :approve }
    it { is_expected.to allow_event :decline }

    it { is_expected.to transition_from(:pending).to(:approved).on_event(:approve) }
    it { is_expected.to transition_from(:pending).to(:declined).on_event(:decline) }
  end
end
