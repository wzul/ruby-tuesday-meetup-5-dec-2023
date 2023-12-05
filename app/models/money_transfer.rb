class MoneyTransfer < ApplicationRecord
  include AASM

  before_commit :delay

  def delay
    sleep(2)
  end

  aasm do
    state :received, initial: true
    state :executing
    state :completed

    event :execute do
      transitions from: :received, to: :executing
    end

    event :complete, after_commit: :charge_customer do
      transitions from: :executing, to: :completed
    end
  end

  def charge_customer
    ChargeCustomerWorker.perform_async(id)
  end
end



