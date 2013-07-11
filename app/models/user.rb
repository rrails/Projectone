# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  location           :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  timezone           :string(255)
#  password_digest    :string(255)
#  preferredstarttime :datetime
#  preferredendtime   :datetime
#  email              :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :location, :preferredstarttime, :preferredendtime,
  :timezone,:password, :password_confirmation, :email, :pref_start, :pref_end
  attr_accessor :lstarttime, :lendtime
  has_secure_password
  has_many :attendees
  has_many :calls, :through => :attendees
  validates :name, :uniqueness => true, :length => {:minimum => 2}
  # validate :datevalidation

  def pref_start
    if preferredstarttime
      preferredstarttime.strftime('%H:%M:%S')
    else
      ''
    end
  end

  def pref_start=(start_time)
    self.preferredstarttime = start_time
  end

  def pref_end
    if preferredendtime
      preferredendtime.strftime('%H:%M:%S')
    else
      ''
    end
  end

  def pref_end=(end_time)
    self.preferredendtime = end_time
  end

  # def  datevalidation
  #   prefe < end
  #   errors.add 'sddsf'
  # end

end
