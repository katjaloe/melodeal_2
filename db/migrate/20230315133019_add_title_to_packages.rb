class AddTitleToPackages < ActiveRecord::Migration[7.0]
  def change
    add_column :packages, :title, :string
  end
end
