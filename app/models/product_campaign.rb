# frozen_string_literal: true

class ProductCampaign < ApplicationRecord
  validates :product_id, :value, :discount, presence: true

  belongs_to :campaign
end
