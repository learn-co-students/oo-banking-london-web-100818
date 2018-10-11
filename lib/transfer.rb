class Transfer


  attr_accessor :sender, :receiver, :transfer, :status, :amount


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.valid? && self.status == 'pending' && sender.balance > self.amount
      sender.deposit(-amount)
      receiver.deposit(amount)
      self.status = 'complete'
    else
      self.status = 'rejected'
      return 'Transaction rejected. Please check your account balance.'
    end
    # binding.pry
  end

  def reverse_transfer
    if self.status == 'complete'
      sender.deposit(amount)
      receiver.deposit(-amount)
      self.status = 'reversed'
    end
  end
end