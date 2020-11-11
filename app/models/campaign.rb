# frozen_string_literal: true

class Campaign < ApplicationRecord
  validates :name, :description, :start_at, :finish_at, presence: true
end
