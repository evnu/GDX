class User
  include Mongoid::Document
  has_many :upload

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  field :name
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false

  field :description, :type => String

  validates :email, :presence => true, :email => true
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :description

end
