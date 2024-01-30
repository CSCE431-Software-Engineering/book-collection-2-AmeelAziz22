# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(
      title: 'Harry Potter',
      author: 'J.K. Rowling',
      price: 29.99,
      published_date: Date.today
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a author' do
    subject.title = "Harry Potter"
    subject.author = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a price' do
    subject.author = "J.K. Rowling"
    subject.price = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a date' do
    subject.price = 29.99
    subject.published_date = nil
    expect(subject).not_to be_valid
  end



  


end