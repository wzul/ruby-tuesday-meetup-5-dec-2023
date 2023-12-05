class CreateMoneyTransfer < ActiveRecord::Migration[7.0]
  def change
    create_table :money_transfers do |t|
      t.string :aasm_state, null: false
      t.timestamps
    end
  end
end
