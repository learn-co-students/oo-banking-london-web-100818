require_relative "bank_account.rb"

class Transfer
  
  attr_reader :sender, :receiver, :amount, :status


  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end


def valid?
  @sender.valid? && @receiver.valid? 

end

def execute_transaction

  if @status == "pending"
  if @sender.balance < @amount 
         
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

  else
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  
  end
end
 

def reverse_transfer
  if @status == "complete"
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
  end

end

end









end