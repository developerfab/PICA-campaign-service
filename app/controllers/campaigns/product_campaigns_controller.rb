# frozen_string_literal: true

class Campaigns::ProductCampaignsController < ApplicationController
  def index
    product_campaigns = ProductCampaings.all
    render json: product_campaigns.to_json
  end
end
