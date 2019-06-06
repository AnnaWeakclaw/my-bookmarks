require 'sinatra/base'
require './lib/bookmark'


class BookmarkManager < Sinatra::Application
  get '/' do
    "Hello World!"
  end

  get '/bookmarks' do
    @bookmark = Book.all
    erb :bookmark
  end

  post '/new_bookmark' do
    
    Book.add(params[:bookmark], params[:title])
    redirect('/bookmarks')
  end

  post '/delete' do
    Book.delete(params[:title])
    redirect('/bookmarks')

  end


end
