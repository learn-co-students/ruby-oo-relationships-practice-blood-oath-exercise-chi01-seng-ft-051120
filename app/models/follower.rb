class Follower
  @@all = []
  attr_accessor :name, :age, :life_motto

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def bloodoaths
    Bloodoath.all.select {|bo| bo.follower == self}
  end

  def cults
    bloodoaths.map {|bo| bo.cult}
  end

  def join_cult(cult)
    Bloodoath.new(self, cult)
  end

  def self.all
    @@all
  end

  def self.of_a_certain_age(age)
    self.all.select {|f| f.age == age}
  end

end