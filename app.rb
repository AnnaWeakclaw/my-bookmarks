require 'sinatra/base'
require './lib/bookmark'
require './actual_setup_with_db_name'

class BookmarkManager < Sinatra::Application

  # for overriding hidden
  enable :sessions, :method_override
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

  delete '/bookmarks/:id' do
    Book.delete(params[:id])
    redirect('/bookmarks')
  end

  get '/bookmarks/update/:id' do
    @id = params[:id]
    erb :update_form
  end

  patch '/bookmarks/:id' do
    Book.update(params[:id], params[:title], params[:bookmark])
    redirect('/bookmarks')
  end
end
