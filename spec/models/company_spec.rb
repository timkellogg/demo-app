require 'rails_helper'

describe Company do 
  it { should have_many :campaigns }
  it { should have_many :clients }
end