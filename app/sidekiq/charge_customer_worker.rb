class ChargeCustomerWorker < SidekiqJob
  def perform(id)
    money_transfer = MoneyTransfer.find(id)
    
    if money_transfer.aasm_read_state == :completed
      puts 'Charge completed!'
    else
      puts 'Charge not completed!'
    end
  end
end
