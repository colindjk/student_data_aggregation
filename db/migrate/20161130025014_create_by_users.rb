class CreateByUsers < ActiveRecord::Migration

  #! TODO: Move code to aggregate to up
  #! This could contain the code to actually
  #! aggregate the data.
  def up
    create_table :by_users do |t|
      # Fields section
      t.string  :user_id,         null: false
      t.string  :inst_book_id,    null: false
      t.string  :inst_section_id, null: false
      t.integer :attempts,        null: false
      t.integer :correct,         null: false
      t.integer :credited,        null: false
      t.integer :interactions
      t.string  :browser_family
      t.string  :os_family
    end


  end

  def down
    drop_table :by_users
  end

end
