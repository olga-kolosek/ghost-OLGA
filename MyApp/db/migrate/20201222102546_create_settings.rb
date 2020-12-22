class CreateSettings < ActiveRecord::Migration[6.0]
  def self.up
    create_table :settings do |t|
      t.string :app_name
      t.string :description
      t.string  :var,        null: false
      t.text    :value,      null: true
      t.timestamps
    end

    add_index :settings, %i(var), unique: true
  end

  def self.down
    drop_table :settings
  end
end
