class DndSkills

    attr_accessor :name, :details
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
       all.detect{ |skill| skill.name == name}
    end

    def update(details)
        self.details = details
    end

    def has_details?
        self.details
    end
end

