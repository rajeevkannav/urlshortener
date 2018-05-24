class AddTinyUrlToWebAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :web_addresses, :tiny_url, :string
    add_index(:web_addresses, [:tiny_url], {unique: true})
  end
end
