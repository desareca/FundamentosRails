class CreateUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :usuarios do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.integer :age

      t.timestamps
    end
  end
end
