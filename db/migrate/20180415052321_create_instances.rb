# frozen_string_literal: true

class CreateInstances < ActiveRecord::Migration[5.2]
  def change
    create_table :instances do |t|
      t.string :host
      t.string :client_id
      t.string :client_secret

      t.timestamps
    end
    add_index :instances, :host, unique: true
  end
end
