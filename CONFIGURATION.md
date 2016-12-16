Student Data Aggregation: Integration
----------------
Below outlines
- The files created for this integration.
- Their role / purpose
- How they should be integrated with the OpenDSA-LTI repository.

#### app/controllers/graphs_controller.rb
-- Role: Provide logic to handle GET request from user, and query Models appropriately.
-- Integration: Add this file to the controllers in OpenDSA-LTI, read the comments for further possibilities.

#### app/assets/javascripts/graph_lib/graphs.js
-- Role: Provide functions to use later in the View's. 
-- Integration: Make sure to modify 'javascripts/application.js' to include the following line:
```javascript
//= require_tree ./graph_lib
```

#### config/routes.rb
-- Role: Provide the routes which are used by the graphs controller.
-- Integration: This file should be modified to allow the user to access the graphs via a different directory from 'root'.
#### db/migrate/*[create_by_users|create_by_days].rb
-- Role: Create the tables which are populated via the code in db/seeds.rb.
-- Integration: These should be able to be included in a sub-folder under the 'migrate' directory.
#### db/seeds.rb
-- Role: Populate the tables ByUser and ByDay.
-- Integration: Append the text in this file to the one existing in OpenDSA-LTI.
