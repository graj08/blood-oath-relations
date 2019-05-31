require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

 kkk = Cult.new("KKK","Montgomery, Alabama", 1865, "We like white people.")
 taliban = Cult.new("Taliban","Afghanistan", 1960, "Leave our homeland")
 scientology = Cult.new("Scientology","New York", 2000, "Tom Cruise is great.")

 ganesh = Follower.new("Ganesh",28,"Mo money mo problems.")
 peter = Follower.new("Peter", 22, "Be nice.")
 prince = Follower.new("Prince",25, "Coding is cool.")

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
