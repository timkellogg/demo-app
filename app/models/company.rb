class Company < ActiveRecord::Base  
  has_many :campaigns
  has_many :clients
  has_and_belongs_to_many :users
  
  validates :name, presence: true
end