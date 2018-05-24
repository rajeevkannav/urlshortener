class AddUserReferencesToWebAddress < ActiveRecord::Migration[5.2]
  def change
    add_reference :web_addresses, :user, index: true
  end
end
