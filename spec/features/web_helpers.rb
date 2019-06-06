# frozen_string_literal: true

def prepare_table
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec('TRUNCATE bookmarks RESTART IDENTITY CASCADE;')
  Book.add('http://askjeeves.com', 'ASK JEEVES')
  Book.add('http://www.makersacademy.com', 'MAKERS')
  Book.add('http://google.com', 'GOOGLE')
end

def go_to_update_form
  visit '/bookmarks'
  fill_in 'title', with: 'Ruby'
  fill_in 'url', with: 'http://www.ruby.org'
  click_button 'add'
  within all(".class_for_marks")[0] do
    click_button("Update")
  end
end
