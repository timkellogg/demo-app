require 'rails_helper'

describe Company do 
  it { should have_many :campaigns }
end