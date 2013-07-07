# == Schema Information
#
# Table name: calls
#
#  id          :integer          not null, primary key
#  subject     :string(255)
#  description :string(255)
#  owner       :string(255)
#  date        :date
#  time        :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Call < ActiveRecord::Base
  attr_accessible :subject, :description, :owner, :date,:time, :attende_ids, :user_ids
  has_many :attendes
  has_many :users, :through => :attendes
end
