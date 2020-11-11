# frozen_string_literal: true

class Campaign < ApplicationRecord
  validates :name, :description, :start_at, :finish_at, presence: true

  has_many :product_campaigns
end
