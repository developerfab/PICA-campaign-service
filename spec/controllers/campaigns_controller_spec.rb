require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do
  describe '#index' do
    let(:campaigns) { Campaign.all }
    let(:response_body) { JSON.parse(response.body) }

    before do
      get :index
    end

    it 'returns the expected account of campaigns' do
      expect(response_body.count).to eq campaigns.count
    end
  end

  describe '#create' do
    context 'when the parameters are valid' do
      let(:response_body) { JSON.parse(response.body) }

      let(:params) do
        {
          campaign: {
            name: 'New campaign',
            description: 'Some here',
            start_at: '15/12/2022',
            finish_at: '18/12/2022'
          }
        }
      end

      before do
        post :create, params: params
      end

      it { expect(response).to have_http_status(201) }

      it 'creates the new campaign' do
        expect(response_body["name"]).to eq params[:campaign][:name]
        expect(response_body["description"]).to eq params[:campaign][:description]
        expect(response_body["start_at"].to_datetime.strftime('%d/%m/%Y')).to eq params[:campaign][:start_at]
        expect(response_body["finish_at"].to_datetime.strftime('%d/%m/%Y')).to eq params[:campaign][:finish_at]
      end
    end

    context "when the missing parameters" do
      let(:response_body) { JSON.parse(response.body) }

      let(:params) do
        {
          campaign: {
            description: 'Some here',
            start_at: '15/12/2022',
            finish_at: '18/12/2022'
          }
        }
      end

      before do
        post :create, params: params
      end

      it { expect(response).to have_http_status(422) }

      it 'returns message error' do
        expect(response_body).to eq({"name"=>["can't be blank"]})
      end
    end
  end

  describe '#show' do
    context 'when the id exist' do
      let(:campaign) { campaigns(:campaign1) }
      let(:response_body) { JSON.parse(response.body) }

      before do
        get :show, params: { id: campaign.id }
      end

      it { expect(response).to have_http_status(200) }

      it 'returns the campaign information' do
        expect(response_body["name"]).to eq campaign.name
        expect(response_body["description"]).to eq campaign.description
        expect(response_body["start_at"].to_datetime.strftime('%d/%m/%Y')).to eq campaign.start_at.strftime('%d/%m/%Y')
        expect(response_body["finish_at"].to_datetime.strftime('%d/%m/%Y')).to eq campaign.finish_at.strftime('%d/%m/%Y')
      end
    end

    context "when the id doesn't exist" do
      let(:response_body) { JSON.parse(response.body) }

      before do
        get :show, params: { id: 123 }
      end

      it { expect(response).to have_http_status(422) }

      it 'returns message error' do
        expect(response_body).to eq("Couldn't find Campaign with 'id'=123")
      end
    end
  end

  describe '#update' do
    context 'when the id exist' do
      let(:campaign) { campaigns(:campaign1) }
      let(:response_body) { JSON.parse(response.body) }

      let(:params) do
        {
          id: campaign.id,
          campaign: {
            id: campaign.id,
            name: "New name",
            description: 'New description',
            start_at: '15/12/2023',
            finish_at: '18/12/2023'
          }
        }
      end

      before do
        put :update, params: params
      end

      it { expect(response).to have_http_status(200) }

      it 'returns the new information' do
        expect(response_body['name']).to eq('New name')
        expect(response_body["description"]).to eq('New description')
        expect(response_body["start_at"].to_datetime.strftime('%d/%m/%Y')).to eq('15/12/2023')
        expect(response_body["finish_at"].to_datetime.strftime('%d/%m/%Y')).to eq('18/12/2023')
      end

      it 'saves the new information' do
        updated_campaign = Campaign.find(campaign.id)
        expect(updated_campaign.name).to eq('New name')
        expect(updated_campaign.description).to eq('New description')
        expect(updated_campaign.start_at.to_datetime.strftime('%d/%m/%Y')).to eq('15/12/2023')
        expect(updated_campaign.finish_at.to_datetime.strftime('%d/%m/%Y')).to eq('18/12/2023')
      end
    end

    context "when the id doen's exist" do
      let(:response_body) { JSON.parse(response.body) }

      before do
        put :update, params: { id: 123 }
      end

      it { expect(response).to have_http_status(422) }

      it 'returns message error' do
        expect(response_body).to eq("Couldn't find Campaign with 'id'=123")
      end
    end
  end
end
