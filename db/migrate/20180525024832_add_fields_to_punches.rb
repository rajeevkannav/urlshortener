class AddFieldsToPunches < ActiveRecord::Migration[5.2]
  def change
    add_column :punches, :user_agent, :string
    add_column :punches, :platform, :string
    add_column :punches, :browser, :string
    add_column :punches, :user_agent_metadata, :string
  end
end
