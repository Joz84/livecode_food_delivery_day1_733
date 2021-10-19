require "csv"
require_relative "../models/customer.rb"

class CustomerRepository
    def initialize(csv_file)
        @customers = []
        @next_id = 1
        @csv_file = csv_file 
        load_csv if File.exist?(@csv_file)
    end

    # CREATE
    def create(customer)
        customer.id = @next_id
        @customers << customer
        @next_id += 1
        save_csv
    end

    # READ
    def all
        @customers
    end 

    # UPDATE
    def find(id)
        @customers.find { |customer| customer.id == id }
    end

    private

    def save_csv
        csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
        CSV.open(@csv_file, 'wb', csv_options) do |csv|
            csv << ['id', 'name', 'address']
            @customers.each do |customer|
                csv << [ customer.id, customer.name, customer.address ]
            end
        end
    end

    def load_csv
        csv_options = { headers: :first_row, header_converters: :symbol }
        CSV.foreach(@csv_file, csv_options) do |row|
            id = row[:id].to_i
            name = row[:name]
            address = row[:address]
            customer = Customer.new(id: id, name: name, address: address)
            @customers << customer
        end
        if @customers.empty?
            @next_id = 1
        else
            @next_id = @customers.last.id + 1
        end
    end
end