# frozen_string_literal: true

feature 'to get to homepage' do
  scenario 'to display string Hello World' do
    visit('/')
    expect(page).to have_content('Hello World!')
  end
end

feature 'viewing bookmarks' do
  scenario 'view bookmarks on page' do
    prepare_table
    visit('/bookmarks')
    expect(page).to have_content('ASK JEEVES')
  end


  scenario 'user provides title with url and saves to list' do
    prepare_table
    visit('/bookmarks')
    fill_in 'title', with: 'ZOINKS'
    fill_in 'url', with: 'http://www.zoinks.com'
    click_button 'add'
    expect(page).to have_content('ZOINKS')
  end

  scenario 'user can click title and goes to website' do
    prepare_table
    visit('/bookmarks')
    click_link 'ASK JEEVES'
    expect(page).to have_current_path('http://askjeeves.com', url: true)
  end

  scenario 'user provides title and the bookmark get deleted' do
    prepare_table
    visit('/bookmarks')
    fill_in 'title', with: 'ASK JEEVES'
    click_button "Delete"
    expect(page).to_not have_content('ASK JEEVES')
  end
end
