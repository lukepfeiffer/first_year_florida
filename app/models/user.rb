class User < ActiveRecord::Base
  include Authem::User
  has_many :experiences

  validates_presence_of :username, :password, :email
  validates_uniqueness_of :username, :email
end
