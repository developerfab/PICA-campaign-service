# frozen_string_literal: true

class ProductCampaign < ApplicationRecord
  validates :product_id, :value, :discount, presence: true

  belongs_to :campaign

  scope :filter_by_campaign_id, -> (campaign_id) { where("campaign_id = ?", campaign_id) }
end
