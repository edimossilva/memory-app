# frozen_string_literal: true

include ActionDispatch::TestProcess
FactoryBot.define do
  factory :memory do
    key { Faker::Name.unique.name.tr("\u0000", '') }
    value { Faker::String.random(length: 5).tr("\u0000", '') }
    visibility { false }
    association :user
  end
end
