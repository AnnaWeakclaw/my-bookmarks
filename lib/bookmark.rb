# frozen_string_literal: true

require 'pg'

class Book
   attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @title = title
    @url = url
  end
  def self.all
    connection = if ENV['RACK_ENV'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
               end
    # result = connection.exec("SELECT * FROM bookmarks;")
    # result.map { |bookmark| bookmark['title'] }
    urls = []
      result = connection.exec('SELECT * FROM bookmarks;')
      result.map { |bookmark|
        Book.new(bookmark['id'], bookmark['url'], bookmark['title'])
      }
    #  url = []
    #  url << bookmark['url']
    #  url << bookmark['title']
    #  urls << url }
    #  urls
   end

   # <a href=<&=url%><%=title></a>
   # <% @bookmark.each do |url|%>
   #  <a href="<%=url[0]%>"><%=url[1]%></a>
   # <% end%>

  def self.add(bookmark, title)
    connection = if ENV['RACK_ENV'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
               end
    new_bookmark = connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{bookmark}','#{title}') RETURNING id, url, title")
    Book.new(new_bookmark[0]['id'], new_bookmark[0]['url'], new_bookmark[0]['title'])
  end

  def self.delete(id)
    connection = if ENV['RACK_ENV'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
               end
    connection.exec("DELETE FROM bookmarks WHERE id = '#{id}'")
  end
end
