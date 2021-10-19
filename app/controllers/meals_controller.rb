require_relative "../views/meals_view.rb"
require_relative "../models/meal.rb"

class MealsController
    def initialize(meal_repository)
        @meal_repository = meal_repository
        @view = MealsView.new
    end

    def list
        meals = @meal_repository.all
        @view.display_list(meals)
    end

    def add
        name = @view.ask_for("Name?")
        price = @view.ask_for("Price?").to_i
        meal = Meal.new({name: name, price: price})
        @meal_repository.create(meal)
    end

end