require 'rubygems'
require 'mysql'
require 'active_record'

ActiveRecord::Base.establish_connection(
    :adapter => "mysql2",
    :database => "opendsa",
    :username => "opendsa",
    :password => "opendsa",
    :host => "localhost",
)

class ByUsers < ActiveRecord::Base; end
class ByDays < ActiveRecord::Base; end

File.open("db/by_users.json", "w") {
  |file| file.write ByUsers.all.to_json()
}

File.open("db/by_days.json", "w") {
  |file| file.write ByDays.all.to_json()
}
