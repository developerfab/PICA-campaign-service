require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:start_at) }
  it { is_expected.to validate_presence_of(:finish_at) }

  it { is_expected.to have_many(:product_campaigns) }

  describe '.campaign_by_product_id' do
    let(:campaigns) { Campaign.filter_by_product_id(1) }

    it 'returns the campaign list' do
      expect(campaigns.count).to eq(2)
      expect(campaigns.map(&:name)).to eq(["Healty", "By an earth more green"])
    end
  end
end
