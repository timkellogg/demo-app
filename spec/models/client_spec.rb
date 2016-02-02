require 'rails_helper'

describe Client do  
  it { should belong_to :user }
  it { should belong_to :company }
end