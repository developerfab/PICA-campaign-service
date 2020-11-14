# frozen_string_literal: true

class ProductCampaignsController < ApplicationController
  def index
    product_campaigns = ProductCampaign.filter_by_campaign_id(params[:campaign_id])
    render json: product_campaigns.to_json
  end

  def create
    product = ProductCampaign.new(product_campaign_params)
    if product.save
      render json: product.to_json, status: :created
    else
      render json: { errors: product.errors }, status: :unprocessable_entity
    end
  end

  private

  def product_campaign_params
    params.require(:products_campaign).permit(:campaign_id, :product_id, :value, :discount)
  end
end
