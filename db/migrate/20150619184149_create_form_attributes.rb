class CreateFormAttributes < ActiveRecord::Migration
  def change
    create_table :form_attributes do |t|
      t.string :width
      t.string :border
      t.string :color
      t.string :background_color
      t.string :font_family
      t.string :button_color
      t.integer :shop_id

      t.timestamps null: false
    end
    add_index :form_attributes, :shop_id
  end
end
