class CreateByDays < ActiveRecord::Migration

  def up
    create_table :by_days do |t|
      t.string  :day_of,    null: false
      t.integer :attempts,  null: false
      t.integer :correct,   null: false
      t.integer :users,     null: false, :default => 0
    end

  end

  def down
    drop_table :by_days
  end


end
