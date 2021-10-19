require "csv"
require_relative "../models/meal.rb"

class MealRepository
    def initialize(csv_file)
        @meals = []
        @next_id = 1
        @csv_file = csv_file 
        load_csv if File.exist?(@csv_file)
    end

    # CREATE
    def create(meal)
        meal.id = @next_id
        @meals << meal
        @next_id += 1
        save_csv
    end

    # READ
    def all
        @meals
    end 

    # UPDATE
    def find(id)
        @meals.find { |meal| meal.id == id }
    end

    private

    def save_csv
        csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
        CSV.open(@csv_file, 'wb', csv_options) do |csv|
            csv << ['id', 'name', 'price']
            @meals.each do |meal|
                csv << [ meal.id, meal.name, meal.price ]
            end
        end
    end

    def load_csv
        csv_options = { headers: :first_row, header_converters: :symbol }
        CSV.foreach(@csv_file, csv_options) do |row|
            id = row[:id].to_i
            name = row[:name]
            price = row[:price].to_i 
            meal = Meal.new(id: id, name: name, price: price)
            @meals << meal
        end
        if @meals.empty?
            @next_id = 1
        else
            @next_id = @meals.last.id + 1
        end
    end
end