class CreateFormularios < ActiveRecord::Migration[6.1]
  def change
    create_table :formularios do |t|
      t.string :nombre
      t.string :dojo
      t.string :lenguaje
      t.text :comentario

      t.timestamps
    end
  end
end
