p "*" * 25
p "running 'follower.rb'"

class Follower
    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name 
        @age = age 
        @life_motto = life_motto 
        
        @@all << self 
    end 

    def cults
        my_blood_oaths = BloodOath.all.select do |blood_oath|
            blood_oath.follower == self 
        end 
        my_blood_oaths.map do |blood_oath|
            blood_oath.cult 
        end 
    end 

    def join_cult(cult)
        if self.age < cult.minimum_age 
            return "I'm sorry.  You are too young to join this cult."
        end 
        date = Time.now.strftime("%Y-%m-%d")
        BloodOath.new(cult, self, date)
    end 

    def self.all 
        @@all 
    end 

    def self.of_a_certain_age(age)
        Follower.all.select do |follower|
            follower.age >= age 
        end 
    end 

    def my_cults_slogans 
        self.cults.each do |cult|
            p slogan 
        end 
    end 

    def self.most_active
        all_followers = BloodOath.all.map do |blood_oath|
            blood_oath.follower
        end  
        all_followers.max_by do |follower|
            all_followers.count(follower)
        end 
    end 

    def self.top_ten 
        all_followers = BloodOath.all.map do |blood_oath|
            blood_oath.follower
        end  
        sorted_followers = all_followers.sort_by do |follower|
            all_followers.count(follower)
        end 
        top_ten = []
        unique_followers = sorted_followers.uniq
        10.times do
            top_ten << unique_followers.pop
        end  
        top_ten
    end

    def fellow_cult_members 
        my_cults = Cult.all.select do |cult|
            cult.followers.include?(self)
        end 
        my_cults_members = my_cults.map do |cult|
            cult.followers 
        end 
        my_cults_flattened = my_cults_members.flatten 
        my_cult_members_unique = my_cults_flattened.uniq
        my_cult_members_unique.select do |member|
            member != self 
        end 
    end 


end 