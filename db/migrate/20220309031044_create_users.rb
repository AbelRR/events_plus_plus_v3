class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :email, index: { unique: true }
      t.string :phone_number, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
