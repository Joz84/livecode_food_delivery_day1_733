class MealsView

    def display_list(meals)
        meals.each do |meal|
            puts "#{meal.id} - #{meal.name} : #{meal.price} €"
        end
    end

    def ask_for(question)
        puts question
        gets.chomp
    end
end