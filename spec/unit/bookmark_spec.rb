# frozen_string_literal: true

describe '.all' do
  it 'returns a list of bookmarks' do
    prepare_table
    bookmark = Book.all
    expect(bookmark.last.title).to eq('GOOGLE')
     expect(bookmark.first.title).to eq('ASK JEEVES')
  end
end

describe '.create' do
  it 'adds new bookmarks to the list' do
    Book.add("http://ruby.org", "Ruby")
    bookmark = Book.all
    expect(bookmark.last.title).to eq('Ruby')
  end
end

describe '.delete' do
  it 'deletes a bookmark from list' do
    prepare_table
    Book.delete(1)
    bookmark = Book.all
    expect(bookmark.length).to eq(2)
  end

  describe '.update' do
    it 'can update title' do 
      prepare_table
      Book.update(1, 'Tortoise')
      bookmark = Book.all
      expect(bookmark.last.title).to eq('Tortoise')
    end
  end
end

