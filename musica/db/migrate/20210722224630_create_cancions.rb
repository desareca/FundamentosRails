class CreateCancions < ActiveRecord::Migration[6.0]
  def change
    create_table :cancions do |t|
      t.string :titulo
      t.string :letra
      t.references :autor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
