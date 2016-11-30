class CreateByDays < ActiveRecord::Migration
  def change
    create_table :by_days do |t|

      t.timestamps null: false
    end
  end
end
