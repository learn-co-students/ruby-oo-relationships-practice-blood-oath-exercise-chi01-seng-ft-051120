require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
emilio = Follower.new("Emilio", 22, "I am, therefore I think.")
masons = Cult.new("Masons", "Chicago", 1997, "Be Water My Friend")
bo = Bloodoath.new(emilio, masons)

dieter = Follower.new("Dieter", 22, "Hinchadito mijo!")
bo_dieter = Bloodoath.new(dieter, masons)
masons.average_age

binding.pry
puts "Mwahahaha!" # just in case pry is buggy and exits