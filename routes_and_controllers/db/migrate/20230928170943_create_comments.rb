class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :artwork, foreign_key: {to_table: :artworks}, null: false
      t.references :author, foreign_key: {to_table: :users}, null: false
      t.text :body
      t.timestamps
    end
  end
end
