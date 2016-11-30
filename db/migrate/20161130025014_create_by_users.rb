class CreateByUsers < ActiveRecord::Migration

  #! TODO: Move code to aggregate to up
  #! This could contain the code to actually
  #! aggregate the data.
  def up
    create_table :by_users do |t|
      # Fields section
      t.string :user, null: false
      # Operating system.
      t.string :os
    end
  end



  def down
    drop_table :by_users
  end

end
