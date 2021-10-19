class CustomersView

    def display_list(customers)
        customers.each do |customer|
            puts "#{customer.id} - #{customer.name} : #{customer.address}"
        end
    end

    def ask_for(question)
        puts question
        gets.chomp
    end
end