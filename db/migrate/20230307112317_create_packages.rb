class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.float :price
      t.float :hours
      t.text :description
      t.references :musician, null: false, foreign_key: true

      t.timestamps
    end
  end
end
