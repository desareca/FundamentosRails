class CreateEquipos < ActiveRecord::Migration[6.0]
  def change
    create_table :equipos do |t|
      t.string :nombre
      t.string :mascota
      t.string :estadio

      t.timestamps
    end
  end
end
