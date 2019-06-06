require './lib/db_connection'

@connection = if ENV["RACK_ENV"] == "test"
  DbConnection.setup("bookmark_manager_test")
else
 DbConnection.setup("bookmark_manager")
end
