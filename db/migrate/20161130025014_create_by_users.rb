class CreateByUsers < ActiveRecord::Migration
  def change
    create_table :by_users do |t|

      t.timestamps null: false
    end
  end
end
