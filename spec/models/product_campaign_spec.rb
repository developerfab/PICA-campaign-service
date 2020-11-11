require 'rails_helper'

RSpec.describe ProductCampaign, type: :model do
  it { is_expected.to validate_presence_of(:product_id) }
  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_presence_of(:discount) }

  it { is_expected.to belong_to(:campaign) }
end
