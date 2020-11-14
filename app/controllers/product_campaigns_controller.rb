# frozen_string_literal: true

class ProductCampaignsController < ApplicationController
  def index
    product_campaigns = ProductCampaign.filter_by_campaign_id(params[:campaign_id])
    render json: product_campaigns.to_json
  end
end
