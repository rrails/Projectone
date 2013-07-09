# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  location           :string(255)
#  preferredstarttime :time
#  preferredendtime   :time
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  timezone           :string(255)
#  password_digest    :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :location, :preferredstarttime, :preferredendtime, :timezone,:password, :password_confirmation
  has_secure_password
  has_many :attendees
  has_many :calls, :through => :attendees
  validates :name, :uniqueness => true
end
