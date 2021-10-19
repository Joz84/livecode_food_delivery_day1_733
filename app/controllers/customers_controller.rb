require_relative "../views/customers_view.rb"
require_relative "../models/customer.rb"

class CustomersController
    def initialize(customer_repository)
        @customer_repository = customer_repository
        @view = CustomersView.new
    end

    def list
        customers = @customer_repository.all
        @view.display_list(customers)
    end

    def add
        name = @view.ask_for("Name?")
        address = @view.ask_for("Address?")
        customer = Customer.new({name: name, address: address})
        @customer_repository.create(customer)
    end

end