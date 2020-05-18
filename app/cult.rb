p "*" * 25
p "running 'cult.rb'"

class Cult 
    attr_reader :name, :location, :founding_year, :slogan
    attr_accessor :followers, :minimum_age

    @@all = []

    def initialize(name, location, founding_year, slogan, minimum_age=0)
        @name = name 
        @location = location 
        @founding_year = founding_year 
        @slogan = slogan
        @minimum_age = minimum_age
        @followers = []
        
        @@all << self 
    end 

    def recruit_follower(follower)
        if follower.age < self.minimum_age 
            return "I'm sorry.  You are too young to join this cult."
        end 
        date = Time.now.strftime("%Y-%m-%d")
        BloodOath.new(self, follower, date)
    end 

    def cult_population
        self.followers.count 
    end 

    def self.all 
        @@all 
    end 

    def self.find_by_name(name)
        self.all.find do |cult|
            cult.name == name  
        end 
    end 

    def self.find_by_location(location)
        self.all.select do |cult|
            cult.location == location 
        end 
    end 

    def self.find_by_founding_year(year)
        self.all.select do |cult|
            cult.founding_year == year 
        end 
    end 

    def average_age
        followers_ages = self.followers.map do |follower|
            follower.age 
        end 
        followers_total_age = followers_ages.reduce(0) do |sum, num|
            sum + num 
        end 
        (followers_total_age / self.followers.count).to_f
    end 

    def followers_mottos 
        self.followers.each do |follower|
            p follower.life_motto 
        end 
    end 

    def self.least_popular 
        self.all.min_by do |cult|
            cult.followers.length 
        end 
    end 

    def self.most_common_location 
        locations = self.all.map do |cult|
            cult.location 
        end 
        locations.max_by do |location|
            locations.count(location)
        end 
    end 

end 