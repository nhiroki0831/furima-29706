class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :title,          null: false
      t.text    :text,           null: false
      t.integer :category,       null: false
      t.integer :condision,      null: false
      t.integer :delivery_fee,   null: false
      t.integer :delivery_area,  null: false
      t.integer :shipping_day,   null: false
      t.ingeger :references,     null: false
      t.timestamps
    end
  end
end
