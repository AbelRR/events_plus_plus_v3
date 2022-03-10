class CreateUsers < ActiveRecord::Migration[7.0]
  def up
    create_enum :user_role, ["admin", "driver", "client"]

    create_table :users do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :email, index: { unique: true }
      t.string :phone_number, null: false, index: { unique: true }
      t.enum :user_role, enum_type: "user_role", default: "client", null: false

      t.timestamps
    end
  end
  def down
    drop_table :users

    execute <<-SQL
      DROP TYPE user_role;
    SQL
  end
end
