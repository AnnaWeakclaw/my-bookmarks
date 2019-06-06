# frozen_string_literal: true

require_relative "db_connection"

class Book
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    result = DbConnection.query("SELECT * FROM bookmarks;")
    result.map { |bookmark|
      Book.new(bookmark["id"], bookmark["url"], bookmark["title"])
    }
  end

  def self.add(bookmark, title)
    new_bookmark = DbConnection.query("INSERT INTO bookmarks (url, title) VALUES ('#{bookmark}','#{title}') RETURNING id, url, title")
    Book.new(new_bookmark[0]["id"], new_bookmark[0]["url"], new_bookmark[0]["title"])
  end

  def self.delete(id)
    DbConnection.query("DELETE FROM bookmarks WHERE id = '#{id}';")
  end

  def self.update(id, title, url)
    DbConnection.query("UPDATE bookmarks SET title = '#{title}' WHERE id = '#{id}';") if title != ""
    DbConnection.query("UPDATE bookmarks SET url = '#{url}' WHERE id = '#{id}';") if url != ""
  end
end
