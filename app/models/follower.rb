class Follower

    attr_accessor :name, :age, :life_motto

    @@all = []

    def initialize (name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all
        @@all
    end

    def cults
        BloodOath.all.select do |blood_oath|
            blood_oath.follower == self
        end.map do |blood_oath|
            blood_oath.cult 
        end
    end

    def join_cult (cult)
        BloodOath.new("2019-05-31",cult,self)
    end

    def self.of_a_certain_age (age)
        @@all.select do |follower|
            follower.age >= age
        end
    end



end
