# == Schema Information
#
# Table name: attendes
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  call_id        :integer
#  meetingdate    :date
#  dateinvited    :date
#  dateofreminder :date
#  accepted       :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#


class Attende < ActiveRecord::Base

attr_accessible :meetingdate, :dateinvited, :dateofreminder, :accepted, :call_id, :user_id
belongs_to :call
belongs_to :user
end
