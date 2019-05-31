class BloodOath

    attr_reader :initiation_date, :cult, :follower

    def initialize (initiation_date, cult, follower)
        @initiation_date = initiation_date
        @cult = cult
        @follower = follower
        @@all << self
    end

    @@all = []

    def self.all
        @@all
    end

end
