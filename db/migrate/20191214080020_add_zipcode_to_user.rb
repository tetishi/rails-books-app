# frozen_string_literal: true

class AddZipcodeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :zipcode, :integer
  end
end
