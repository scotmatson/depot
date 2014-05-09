class AddDescriptionUaToProduct < ActiveRecord::Migration
  def change
    add_column :products, :description_es, :text
  end
end
