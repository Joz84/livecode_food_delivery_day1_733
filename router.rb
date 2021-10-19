class Router
    def initialize(meals_controller, customers_controller)
        @running = true
        @meals_controller = meals_controller
        @customers_controller = customers_controller
    end

    def run
        while @running
            puts "Welcome"
            puts "0 - quit"
            puts "1 - List meals"
            puts "2 - Create a meal"
            puts "3 - List customers"
            puts "4 - Create a customer"
            puts "Your choice?"
            print "> "
            choice = gets.chomp.to_i

            case choice
            when 0 then @running = false
            when 1 then @meals_controller.list
            when 2 then @meals_controller.add
            when 3 then @customers_controller.list
            when 4 then @customers_controller.add
            else
                puts "Tes un gros naze!"
            end
        end
    end

end

