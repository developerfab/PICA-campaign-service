require 'rails_helper'

RSpec.describe Campaigns::ProductCampaignsController, type: :controller do
  describe '#index' do
    let(:campaign) { campaigns(:campaign1) }
    let(:response_body) { JSON.parse(response.body) }

    before do
      get :index, params: { campaign_id: campaign.id }
    end

    it { expect(response_body.count).to eq(2) }

    it 'returns the product list' do
    end
  end
end
