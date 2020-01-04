# frozen_string_literal: true

class AddAddressToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :address, :string
  end
end
