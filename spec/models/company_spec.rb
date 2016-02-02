require 'rails_helper'

describe Company do 
  context 'relationships' do
    it { should have_many :campaigns }
    it { should have_many :clients }
    it { should have_and_belong_to_many :users }
  end
end