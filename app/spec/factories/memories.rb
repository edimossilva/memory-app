# frozen_string_literal: true

include ActionDispatch::TestProcess
FactoryBot.define do
  factory :memory do
    key { Faker::Name.unique.name }
    value { Faker::String.random(length: 5) }
    visibility { false }
  end
end
