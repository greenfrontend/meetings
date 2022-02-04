# frozen_string_literal: true

require 'factory_bot'

user = FactoryBot.create(:user)

30.times do
  FactoryBot.create(:event, user_id: user.id)
end

FactoryBot.create(:user, :admin)
