class CreateWebAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :web_addresses do |t|
      t.text :url
      t.timestamps
    end
  end
end
