# == Schema Information
#
# Table name: calls
#
#  id          :integer          not null, primary key
#  subject     :string(255)
#  description :string(255)
#  organiser   :string(255)
#  date        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  calldetail  :string(255)
#  attachment  :text
#  time        :datetime
#

class Call < ActiveRecord::Base
  attr_accessible :subject, :description, :organiser, :date,:time, :attendee_ids,
                  :user_ids, :calldetail, :attachment, :meet_time
  attr_accessor :lmeettime
  has_many :attendees
  has_many :users, :through => :attendees

  def meet_time

  end

  def meet_time=(mtime)
      self.time = mtime
  end
end
