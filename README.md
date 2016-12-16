Student Data Aggregation
----------------

Writtern in Ruby on Rails, this application aggregates data from a central OpenDSA database, and produces tables with useful data used to produce interactive, visual graphs and statistics.

---

## Running the application
- [VM Configuration](#VMConfiguration)
- [Setup](#Setup) the environment
- [Initialize](#Initialize) the Rails application

#### VM Configuration
1. Make sure you have followed the instructions at  [OpenDSA-DevStack](https://github.com/OpenDSA/OpenDSA-DevStack) to set up a working Ubuntu virtual machine.
2. Next, add the following to your VagrantFile.
```ruby
# Forward the Rails server default port to the host machine
config.vm.network :forwarded_port, guest: 3000, host: 3000
```
3. Restart your virtual machine with the command ```vagrant reload```.

#### Setup
1. Make sure your VM has been succesfully restarted, then SSH into your VM with ```vagrant ssh```.
2. Next you must create and populate the _opendsa_ database with (anonymous) data via provided SQL scripts. Once you have access to said scripts, switch to the directory in which you have stored them, and run the following:
```sh
# Using the password 'opendsa', this is one of many ways to execute the provided scripts.
cat *.sql | mysql -u opendsa -p
```
3. Once you have verified that the scripts have run succesfully, switch to the directory where you would like to store the [student_data_aggregation](https://github.com/colindjk/student_data_aggregation) repository.
4. Clone the [repository](https://github.com/colindjk/student_data_aggregation.git), then change directories.
```sh
git clone https://github.com/colindjk/student_data_aggregation.git
cd student_data_aggregation
```
5. Run ```bundle install``` to install the required Gems.
NOTE: You may have to remove the ```foreigner``` Gem if you have either, upgraded Ruby versions, or are running this on your host machine instead of the OpenDSA-DevStack. No other changes to the repo should be necessary, please create an issue if that is not the case for you.

Once you have succesfully run the previous steps, move onto the next phase.

#### Initialize the Rails application
1. Verify that you are in the root directory of the student_data_aggregation repository.
2. To setup the models used in the application, run the following commands in your terminal:
```sh
# Create the tables 'ByUser' and 'ByDay'
rails db:migrate
# Populate the created tables with aggregated data, source found in db/seeds.rb
rails db:seed
```
3. You can then use the rails console to verify that you 'ByUser' and 'ByDay' models have succesfully been created. To do this use the command ```rails console```, then enter:
```ruby
# Limit output to the last 20 records, modify limit if necessary
ByDay.last(20).as_json
ByUser.last(20).as_json
```
4. If the previous steps yeilds no entries, remove the created tables if any exist, and repeat step 2.
5. Once you have verified that the Model tables were created and populated succefully, you can run the application:
```sh
# Bind to address '0.0.0.0' to allow host machine access.
rails server -b 0.0.0.0
```
The Rails application should be running, and accessible on your host machine via the address 'localhost:3000'.

---

## Working with the Application
Below are the topics of interacting with the actual application from the clients perspective. Then followed by information regarding further development, or for using the resources provided by the application.
#### Interacting with the site
Once you have succesfully gotten the Rails application up and running, you can visit the site at 'localhost:3000'. There you will find a form to provide parameters which are used to generate graphs. Alternatively you can view precompiled statistics under the tabs 'ByUser' and 'ByDay'.
#### Development and Integration
For notes on development, as well as methods for integrating this application with OpenDSA-LTI, see the CONFIGURATION.md file.

