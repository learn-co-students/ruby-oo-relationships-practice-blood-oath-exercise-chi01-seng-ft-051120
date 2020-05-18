require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


cult_1 = Cult.new("blood", "Dallas", 2002, "YOLO", 18)
cult_2 = Cult.new("oaths", "Chicago", 1986, "Get it")
cult_3 = Cult.new("sangre", "NY", 2000, "Viva")
cult_4 = Cult.new("friends", "NY", 1925, "Friends are fun")
cult_5 = Cult.new("enemies", "DC", 1876, "Why are we here?")

follower_1 = Follower.new("Steven", 26, "YOLO")
follower_2 = Follower.new("Sara", 18, "Viva")
follower_3 = Follower.new("Mike", 30, "What's up?")
follower_4 = Follower.new("Eric", 50, "Friends are fun")
follower_5 = Follower.new("Andy", 16, "You got a friend in me")
follower_6 = Follower.new("Mitch", 21, "What's Up?")
follower_7 = Follower.new("Miguel", 30, "¡Hola!")
follower_8 = Follower.new("Ellen", 26, "One day at a time")
follower_9 = Follower.new("Sandy", 16, "Summer Lovin")
follower_10 = Follower.new("Glinda", 18, "Gonna be Popular")

blood_oath_1 = BloodOath.new(cult_1, follower_1, "2019-03-12")
blood_oath_2 = BloodOath.new(cult_2, follower_2, "2018-02-14")
blood_oath_3 = BloodOath.new(cult_3, follower_6, "2013-06-21")
blood_oath_4 = BloodOath.new(cult_1, follower_4, "2012-05-20")
blood_oath_5 = BloodOath.new(cult_2, follower_5, "2020-05-27")
blood_oath_6 = BloodOath.new(cult_2, follower_10, "1990-08-21")
blood_oath_7 = BloodOath.new(cult_5, follower_9, "2002-09-16")
blood_oath_8 = BloodOath.new(cult_4, follower_7, "2006-08-23")
blood_oath_9 = BloodOath.new(cult_3, follower_8, "2013-04-16")
blood_oath_10 = BloodOath.new(cult_1, follower_6, "2015-12-12")
blood_oath_11 = BloodOath.new(cult_4, follower_3, "2012-12-12")
blood_oath_12 = BloodOath.new(cult_5, follower_6, "1990-12-21")
blood_oath_13 = BloodOath.new(cult_4, follower_1, "2005-09-16")

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits