class BankAccount

    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name)
        @balance = 1000
        @status = 'open'
        @name = name
    end

    def deposit(amount)
        @balance += amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if self.status == "open" && self.balance > 0
            return true
        end
            false
    end

    def close_account
        self.status = "closed"
    end
end
