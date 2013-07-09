# == Schema Information
#
# Table name: calls
#
#  id          :integer          not null, primary key
#  subject     :string(255)
#  description :string(255)
#  organiser   :string(255)
#  date        :date
#  time        :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Call < ActiveRecord::Base
  attr_accessible :subject, :description, :organiser, :date,:time, :attendee_ids, :user_ids
  has_many :attendees
  has_many :users, :through => :attendees
end
