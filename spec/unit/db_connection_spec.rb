require 'db_connection'

describe DbConnection do 
  it "can connect to database" do
    expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
    DbConnection.setup("bookmark_manager_test")
  end

  it "can has a connection to database" do
    conn = DbConnection.setup("bookmark_manager_test")
    expect(DbConnection.connection).to eq(conn)
  end
  it "can execute a SQL query" do
    DbConnection.setup("bookmark_manager_test")
    expect(DbConnection.connection).to receive(:exec).with("SELECT * FROM bookmarks;")
    DbConnection.query("SELECT * FROM bookmarks;")
    
  end
end