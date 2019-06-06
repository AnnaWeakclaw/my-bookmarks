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
    expect(page).to have_link('ZOINKS', href: 'http://www.zoinks.com' )
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
    fill_in 'title', with: 'Ruby'
    fill_in 'url', with: 'http://www.ruby.org'
    click_button 'add'
    expect(page).to have_link('Ruby', href: 'http://www.ruby.org' )
    # this deletes the fourth element
    within all(".class_for_marks")[3] do
      click_button("Delete")
   end
    
    expect(current_path).to eq '/bookmarks'
    expect(page).to_not have_content('Ruby')
  end

  scenario 'user can open the update form' do
    go_to_update_form
    expect(page).to have_content('New url:')
  end

  scenario 'user can update the title' do
    go_to_update_form
    fill_in 'title', with: 'Tortoise'
    click_button 'Save'
    expect(page).to have_content('Tortoise')
  end
end
