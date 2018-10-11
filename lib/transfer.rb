class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
      return true if sender.valid? == true && receiver.valid? == true
  end

  def execute_transaction
    if (sender.balance - amount) < 0
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    end
  end


end
