class CreateCompradors < ActiveRecord::Migration[6.0]
  def change
    create_table :compradors do |t|
      t.string :nombre
      t.string :apellido
      t.references :marca, null: false, foreign_key: true

      t.timestamps
    end
  end
end
