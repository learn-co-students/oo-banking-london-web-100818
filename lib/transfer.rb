class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
    if @status == "pending"
      if @sender.balance < @amount
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      else
        @sender.deposit(0-@amount)
        @receiver.deposit(@amount)
        return @status = "complete"
      end
    end
    @status = "rejected"
  end
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(0-@amount)
      @status = "reversed"
    end
  end

end
