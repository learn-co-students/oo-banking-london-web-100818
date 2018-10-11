class BankAccount

  attr_accessor :balance, :deposit, :status
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@all << self
  end

  # deposit
  def deposit(amount)
    @balance += amount
  end

  # display_balance
  def display_balance
    return "Your balance is $#{self.balance}."
  end

  # valid?
    # true for open & balance > 0
  def valid?
    if self.balance > 0 && self.status == "open"
      true
    else
      false
    end
  end

  # close_account
  def close_account
    @status = "closed"
  end
end
