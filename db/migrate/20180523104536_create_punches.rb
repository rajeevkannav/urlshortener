class CreatePunches < ActiveRecord::Migration[5.2]
  def change
    create_table :punches do |t|
      t.references :web_address
      t.string :ip_address
      t.string :http_referer
      t.text :request_object

      t.timestamps
    end
  end
end
