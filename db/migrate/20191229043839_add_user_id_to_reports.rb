# frozen_string_literal: true

class AddUserIdToReports < ActiveRecord::Migration[6.0]
  def change_column
    add_column :reports, :user_id, :integer
  end
end
