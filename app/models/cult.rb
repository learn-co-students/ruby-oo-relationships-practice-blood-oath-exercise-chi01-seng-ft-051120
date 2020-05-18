class Cult
  @@all = []

  attr_accessor :name, :location, :founding_year, :slogan, :followers
    def initialize(name, location, founding_year, slogan)
      @name = name
      @location = location
      @founding_year = founding_year
      @slogan = slogan
      @@all << self
    end

    def self.all
      @@all
    end

    def bloodoaths
      Bloodoath.all.select {|bo| bo.cult == self}
    end

    def followers
      bloodoaths.map {|bo| bo.follower}
    end

    def recruit_follower(follower)
      Bloodoath.new(follower, self)
    end

    def cult_population
      followers.count
    end

    def find_by_name(name)
      self.all.find {|c| c.name == name}
    end

    def find_by_location(location)
      self.all.find_all {|c| c.location == location}
    end

    def find_by_fouding_year(founding_year)
      self.all.find_all {|c| c.founding_year == founding_year}
    end

    def average_age
      ages = []
      followers.each {|f| ages << f.age}
      (ages.sum / followers.length).to_f
    end

    def my_followers_mottos
      followers.map {|f| f.life_motto}
    end

    def self.least_popular
      self.all.min_by {|cult| cult.followers.length}
    end

    def self.most_common_location
      location = cult_locations.max

    end

end