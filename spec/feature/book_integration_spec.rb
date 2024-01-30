# spec/feature/integration_spec.rb

require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'book[title]', with: 'Harry Potter'
    fill_in 'book[author]', with: 'J.K. Rowling'
    fill_in 'book[price]', with: 29.99
    fill_in 'book[published_date]', with: '2022-01-31'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('Harry Potter')
    expect(page).to have_content('J.K. Rowling')
    expect(page).to have_content('$29.99')
    expect(page).to have_content('2022-01-31')
    # Uncomment the line below if you want to check for the flash notice
    # expect(page).to have_content('Book was successfully created.')
  end

  scenario 'blank title (rainy-day scenario)' do
    visit new_book_path
    fill_in 'book[title]', with: ''
    fill_in 'book[author]', with: 'John Doe'
    fill_in 'book[price]', with: 19.99
    fill_in 'book[published_date]', with: '2022-01-31'
    click_on 'Create Book'
    expect(page).to have_content("Title can't be blank")
  end

  scenario 'blank author (rainy-day scenario)' do
    visit new_book_path
    fill_in 'book[title]', with: 'Sample Book'
    fill_in 'book[author]', with: ''
    fill_in 'book[price]', with: 19.99
    fill_in 'book[published_date]', with: '2022-01-31'
    click_on 'Create Book'
    expect(page).to have_content("Author can't be blank")
  end

  scenario 'blank price (rainy-day scenario)' do
    visit new_book_path
    fill_in 'book[title]', with: 'Sample Book'
    fill_in 'book[author]', with: 'John Doe'
    fill_in 'book[price]', with: ''
    fill_in 'book[published_date]', with: '2022-01-31'
    click_on 'Create Book'
    expect(page).to have_content("Price can't be blank")
  end

  scenario 'blank published date (rainy-day scenario)' do
    visit new_book_path
    fill_in 'book[title]', with: 'Sample Book'
    fill_in 'book[author]', with: 'John Doe'
    fill_in 'book[price]', with: 19.99
    fill_in 'book[published_date]', with: ''
    click_on 'Create Book'
    expect(page).to have_content("Published date can't be blank")
  end
end
