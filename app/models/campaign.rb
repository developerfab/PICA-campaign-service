# frozen_string_literal: true

class Campaign < ApplicationRecord
  validates :name, :description, :start_at, :finish_at, presence: true

  has_many :product_campaigns

  scope :filter_by_product_id, -> (product_id) { where(id: ProductCampaign.where("product_id = ?", product_id).map{ |x| x.campaign_id}) }
  scope :filter_by_frame, -> (date) { where("start_at <= (?) AND finish_at >= (?)", date.to_time, date.to_time) }
end
