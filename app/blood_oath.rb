p "*" * 25
p "running 'blood_oath.rb'"

class BloodOath
    attr_reader :cult, :follower, :initiation_date

    @@all = []

    def initialize(cult, follower, initiation_date)
        @cult = cult 
        @follower = follower 
        @initiation_date = initiation_date 

        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def self.first_oath 
        list_of_dates = self.all.map do |blood_oath|
            blood_oath.initiation_date.split(/-/)
        end
        date_calc = list_of_dates.map do |date|
            date.join.to_i 
        end 
        earliest = date_calc.min_by do |date|
            date 
        end
        earliest_blood_oath = self.all.find do |blood_oath|
            blood_oath.initiation_date.split(/-/).join.to_i == earliest 
        end 
        earliest_blood_oath.follower  
    end 
end