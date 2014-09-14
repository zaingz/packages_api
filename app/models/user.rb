class User < ActiveRecord::Base
  has_secure_password

  has_one :api_key, dependent: :destroy
  has_many :packages, :dependent => :destroy

  after_create :create_api_key

  ##Validation
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  validates :username, length: {within: 2..15}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }



  def create_api_key
    ApiKey.create :user => self
  end

end
