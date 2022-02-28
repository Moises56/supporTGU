class AddColumnStateToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :state, :string, default: "start"
  end
end
