class AddStateToSale < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :state, :string
    add_column :sales, :stripe_id, :string
    add_column :sales, :stripe_token, :string
    add_column :sales, :error, :text
  end
end
