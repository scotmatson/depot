class AddTitleUaToProduct < ActiveRecord::Migration
  def change
    add_column :products, :title_es, :string
  end
end
