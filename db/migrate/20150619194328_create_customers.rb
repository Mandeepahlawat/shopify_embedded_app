class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :shop_id
      t.integer :shopify_customer_id

      t.timestamps null: false
    end
    add_index :customers, :shop_id
    add_index :customers, :shopify_customer_id
  end
end
