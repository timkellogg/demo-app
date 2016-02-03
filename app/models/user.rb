class User < ActiveRecord::Base
  has_many :clients
  has_and_belongs_to_many :companies

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # :confirmable, :lockable, :timeoutable
         
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  # Avoids needing to confirm via email in development for devise sign-up
  # skip_confirmation! if Rails.env == 'development'
  
end
