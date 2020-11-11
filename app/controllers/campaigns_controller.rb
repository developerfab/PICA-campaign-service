# frozen_string_literal: true

class CampaignsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    campaigns = Campaign.all
    render json: campaigns.to_json
  end

  def create
    campaign = Campaign.new(campaign_params)
    if campaign.save
      render json: campaign.to_json, status: :created
    else
      render json: campaign.errors, status: :unprocessable_entity
    end
  end

  def show
    campaign = Campaign.find(params[:id])
    render json: campaign, status: :ok
  end

  def update
    campaign = Campaign.find(params[:id])

    if campaign.update(campaign_params)
      render json: campaign.to_json, status: :ok
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :description, :start_at, :finish_at)
  end

  def record_not_found(message)
    render json: message.to_json, status: :unprocessable_entity
  end
end
