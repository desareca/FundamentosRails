class CreateMarcas < ActiveRecord::Migration[6.0]
  def change
    create_table :marcas do |t|
      t.string :modelo
      t.string :marca

      t.timestamps
    end
  end
end
