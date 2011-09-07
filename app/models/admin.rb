class Admin
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable,
         :rememberable, :trackable, :validatable
  field :name, :type => String
  validates_presence_of :name
  validates :email, :email => true, :presence => true
  validates_uniqueness_of :name, :email, :case_sensitive => false
  attr_accessible :name, :email, :password
end
