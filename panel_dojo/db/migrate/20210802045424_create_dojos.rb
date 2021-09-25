class CreateDojos < ActiveRecord::Migration[6.1]
  def change
    create_table :dojos do |t|
      t.string :sucursal
      t.string :calle
      t.string :ciudad
      t.string :estado

      t.timestamps
    end
  end
end
