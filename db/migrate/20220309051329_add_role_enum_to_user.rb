class AddRoleEnumToUser < ActiveRecord::Migration[7.0]
  def up
    create_enum :user_role, ["admin", "driver", "client"]

    change_table :users do |t|
      t.enum :user_role, enum_type: "user_role", default: "client", null: false
    end
  end
  
  # There's no built in support for dropping enums, but you can do it manually.
  # You should first drop any table that depends on them.
  def down
    execute <<-SQL
      DROP TYPE user_role;
    SQL
  end
end
