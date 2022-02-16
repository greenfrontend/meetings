# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:events) }
  end

  describe 'admins scope' do
    context 'with role Admin' do
      let(:admin) { create(:user, :admin) }

      it 'includes users' do
        expect(described_class.admins).to include(admin)
      end
    end

    context 'without role Admin' do
      let(:user) { create(:user) }

      it 'excludes users' do
        expect(described_class.admins).not_to include(user)
      end
    end
  end
end
