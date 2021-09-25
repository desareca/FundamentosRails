class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content_comm
      t.references :comm, polymorphic: true, null: false

      t.timestamps
    end
  end
end
