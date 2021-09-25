class CreateEmpleados < ActiveRecord::Migration[6.0]
  def change
    create_table :empleados do |t|
      t.string :nombre
      t.string :apellido

      t.timestamps
    end
  end
end
