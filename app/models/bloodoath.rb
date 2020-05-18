class Bloodoath
  @@all = []
  attr_accessor :initiation_date, :follower, :cult
  
  def initialize(follower, cult)
    @initiation_date = "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
    @follower = follower
    @cult = cult
    @@all << self
  end

  def self.all
    @@all
  end
end