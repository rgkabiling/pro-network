class User < ActiveRecord::Base
  has_secure_password
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, :presence =>true

  validates :description, :presence =>true

  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }

  validates :password, :presence => true

  validates :password, length: {minimum:8}

  has_many :networks, :foreign_key => "user_id", :class_name => "Network"
  has_many :networkees, through: :networks

  has_many :invites, :foreign_key => "user_id", :class_name => "Invite"
  has_many :invitees, through: :invites

end
