class Meal
    attr_accessor :id
    attr_reader :name, :price
    
    def initialize(attrs={})
        @id = attrs[:id]
        @name = attrs[:name]
        @price = attrs[:price]
    end
end
