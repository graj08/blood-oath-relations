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

    def average_age
        sum = 0.0
        count = 0
        self.followers.each do |follower|
        sum += follower.age
        count += 1
        end
        sum / count
    end

    def my_followers_mottos
        self.followers.each do |follower|
            puts follower.motto
        end
    end

    def self.least_popular
        least_popular = @@all[0]
        count = least_popular.cult_population
        @@all.each do |cult|
            if cult.cult_population < count
                least_popular = cult
            end
        end
    end

    def self.most_common_location
        all_locations = @@all.collect do |cult|
            cult.location
        end
        first_instance_location = @@all[0].location
        most_common_location = first_instance_location
        most_common_count = @@all.select do |cult|
            cult.location == first_instance_location
        end.count
        all_locations.each do |location|
            if Cult.find_by_location(location).count > most_common_count
                most_common_count = Cult.find_by_location(location).count
                most_common_location = location
            end
        end
        most_common_location
    end
        ## zeroth line: make array of all locations
        ## first line: let's take the location of the first instance
        ## second line: let's count how many cults there are at this location
        ## third line: let's iterate through all_locations and compare with second line
        ## fourth line: if there's more than that's the new most common


end
