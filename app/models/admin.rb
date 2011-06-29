class Admin
  include Mongoid::Document
  devise :database_authenticatable, :validatable

  field :name, :type => String
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  attr_accessible :name
end
