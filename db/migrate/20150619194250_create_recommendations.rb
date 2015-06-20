class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :customer_id
      t.string :shopify_product_id
      t.string :friend_email
      t.text :comment

      t.timestamps null: false
    end
  end
end
