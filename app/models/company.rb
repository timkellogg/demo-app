class Company < ActiveRecord::Base  
  has_many :campaigns
  has_many :clients
end