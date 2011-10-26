# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Event.delete_all

api_key = ApiKey.create(:public_access => true)
api_key.key = "9b02756d6564a40dfa6436c3001a1441"
api_key.save

50.times do |t|
  User.create(:email => "fake#{t}@fake.com", :lat => 37.410433 + rand * 0.0001, :lng => -122.059775 + rand * 0.0001, 
    :token => api_key.key+t.to_s, :secret => api_key.key+t.to_s, :uid => rand(99999).to_s, :screen_name => "test#{t}", 
    :profile_image_url => "http://www.gravatar.com/avatar/be7277afee6440ba214c06223091fbfb?s=80&d=http://pic.yupoo.com/jdvip/271258f17cef/small.gif&r=G",
    :description => "test", :time_zone => "PST")
end

100.times do |t|
  Event.create(:name => "test#{t}", :description => "test#{t}", :url => "www.meetup.com", :lat => 37.410433 + rand * 0.0001, :lng => -122.059775 + rand * 0.0001,
    :address => "test", :event_time => Time.now+rand(365).days)
end