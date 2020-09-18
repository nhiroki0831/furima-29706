class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string     :postal_code,  null: false
      t.integer    :prefectures,  null: false
      t.string     :city,         null: false
      t.string     :address,      null: false
      t.string     :building
      t.string     :tel,          null: false
      t.references :order,        foreign_key: true
      t.timestamps
    end
  end
end