require 'rails_helper'

RSpec.describe CampaignsHelper, type: :helper do
  
  describe '#get_channels' do  
    it 'should return a listing of channels' do  
      expect(get_channels).to eq [['Yahoo'], ['LinkedIn'], ['Facebook'], ['Google'], ['Other']]
    end
  end
  
  describe '#get_campaign_types' do  
    it 'should return a listing of campaign types' do  
      expect(get_campaign_types).to eq [['Scrape'], ['List'], ['Ads'], ['Other']]
    end
  end
end
