require 'rails_helper'

describe Campaign do 
  context 'relationships' do  
    it { should belong_to :company }
  end
  
  context 'validations' do 
    it { should validate_presence_of :company_id }
    it { should validate_presence_of :name }
    it { should validate_presence_of :channel }
    it { should validate_presence_of :campaign_type }
    it { should validate_presence_of :campaign_date }
    it { should validate_presence_of :file_url }
  end
end
