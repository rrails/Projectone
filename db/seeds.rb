# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Call.destroy_all
Attendee.destroy_all

u1 = User.create(:name => 'John Payne', :location => 'London', :preferredstarttime => '08:00',:preferredendtime => '20:00', :timezone => 'London', :password => 'abc')
u2 = User.create(:name => 'Tom Miller', :location => 'New York', :preferredstarttime => '09:00',:preferredendtime => '20:00', :timezone => 'New York', :password => 'abc')
u3 = User.create(:name => 'Joe Blog', :location => 'Sydney', :preferredstarttime => '08:00',:preferredendtime => '20:00', :timezone => 'Sydney', :password => 'abc')
u4 = User.create(:name => 'Nick Deacon', :location => 'London', :preferredstarttime => '08:00',:preferredendtime => '20:00', :timezone => 'London', :password => 'abc')


c1 = Call.create(:subject => 'Project Status', :description => 'Discuss current issues',:owner => 'John Payne', :date => '08/07/2013', :time => '10:00')
c2 = Call.create(:subject => 'Sales Status', :description => 'Discuss 2nd qtr revenue forecast',:owner => 'Nick Deacon', :date => '12/07/2013', :time => '12:00')
c3 = Call.create(:subject => 'Release Update', :description => 'Discuss delivery options',:owner => 'Joe Blog', :date => '14/07/2013', :time => '13:00')




#  name               :string(255)
#  location           :string(255)
#  preferredstarttime :time
#  preferredendtime   :time
#
#  timezone           :string(255)
#  password_digest    :string(255)