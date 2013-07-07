# == Schema Information
#
# Table name: attendes
#
#  id             :integer          not null, primary key
#  meetingdate    :date
#  dateinvited    :date
#  dateofreminder :date
#  accepted       :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'composite_primary_keys'
class Attende < ActiveRecord::Base
self.primary_keys = :call_id, :user_id

attr_accessible :meetingdate, :dateinvited, :dateofreminder, :accepted, :call_id, :user_id
belongs_to :call
belongs_to :user
end