class Cult
    
    attr_accessor :name, :location, :founding_year, :slogan

    @@all = []

    def initialize (name, location, founding_year, slogan)
        @name = name
        @@all << self
        @location = location
        @founding_year = founding_year
        @slogan = slogan
    end

    def followers
        BloodOath.all.select do |blood_oath|
            blood_oath.cult == self
        end.map do |blood_oath|
            blood_oath.follower
        end          
    end

    def self.all
        @@all
    end

    def recruit_follower (follower)
        BloodOath.new("2019-05-31",self,follower)
    end

    def cult_population
        self.followers.count
    end

    def self.find_by_name (name)
        @@all.find do |cult|
            cult.name == name
        end
    end

    def self.find_by_location (location)
        @@all.select do |cult|
            cult.location == location
        end
    end


    def self.find_by_founding_year (founding_year)
        @@all.select do |cult|
            cult.founding_year == founding_year
        end
    end


end
