require 'rails_helper'

RSpec.describe ProductCampaignsController, type: :request do
  describe '#index' do
    let(:campaign) { campaigns(:campaign1) }
    let(:response_body) { JSON.parse(response.body) }

    before do
      get campaign_product_campaigns_path(campaign_id: campaign.id)
    end

    it { expect(response_body.count).to eq(2) }

    it 'returns the products of the campaign' do
      response_body.each do |product|
        expect(product['campaign_id']).to eq(campaign.id)
      end
    end
  end

  describe '#create' do
    context 'when the parameters are correct' do
      let(:campaign) { campaigns(:campaign1) }
      let(:response_body) { JSON.parse(response.body) }

      let(:params) do
        {
          products_campaign: {
            campaign_id: campaign.id,
            product_id: 3,
            value: 60_000,
            discount: 0.4
          }
        }
      end

      before do
        post campaign_product_campaigns_path(campaign_id: campaign.id), params: params
      end

      it { expect(response).to have_http_status(201) }

      it 'returns the product information' do
        expect(response_body).to include('campaign_id')
        expect(response_body).to include('product_id')
        expect(response_body).to include('value')
        expect(response_body).to include('discount')
      end
    end

    context 'when the missing parameters' do
      let(:campaign) { campaigns(:campaign1) }
      let(:response_body) { JSON.parse(response.body) }

      let(:params) do
        {
          products_campaign: {
            product_id: 3,
            value: 60_000,
            discount: 0.4
          }
        }
      end

      before do
        post campaign_product_campaigns_path(campaign_id: campaign.id), params: params
      end

      it { expect(response).to have_http_status(422) }

      it 'returns a message error' do
        expect(response_body['errors']).to eq({"campaign"=>["must exist"]})
      end
    end
  end
end
