class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :author
      t.text :message
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
