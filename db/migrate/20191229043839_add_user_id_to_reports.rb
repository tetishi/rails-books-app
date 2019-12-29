class AddUserIdToReports < ActiveRecord::Migration[6.0]
  # def up
  #   add_column :reports, :user_id, :integer
  #   change_column :reports, :user_id, :integer
  # end

  # def down
  #   change_column :reports, :user_id, :integer
  # end

  def change_column
    add_column :reports, :user_id, :integer
  end
end
