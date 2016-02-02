require 'rails_helper'

describe User do
  it { should have_many :clients }
  it { should have_and_belong_to_many :companies }
end
