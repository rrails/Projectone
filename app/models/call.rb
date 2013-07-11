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
#  calldetail  :string(255)
#  attachment  :text
#

class Call < ActiveRecord::Base
  attr_accessible :subject, :description, :organiser, :date,:time, :attendee_ids,
                  :user_ids, :calldetail, :attachment, :meet_time
  has_many :attendees
  has_many :users, :through => :attendees

  def meet_time
    if time
      time.strftime('%H:%M')
    else
      ''
    end
  end

  def meet_time=(mtime)
      self.time = mtime
  end
end