require 'Library'

describe Library do
  before(:all) do
    @books = Library.new
    @new_book = {title:'Melusine'}
  end

  it 'should list all the books in the library' do
    expect(@books.list_books).to include(
      {title: 'POODR', author: 'Sandi Metz', subject: 'OOP'}
    )
  end

  it 'should add a given new book to the library' do
  #  new_book = {title:'Melusine'}
    @books.add_book(@new_book)
    expect(@books.list_books).to include(@new_book)
  end

  it 'should find and return book given the title' do
    expect(@books.find_book('Melusine')).to eq(@new_book)
  end

  it 'should remove book from the library given the title' do
    @books.remove_book('Melusine')
    expect(@books.list_books).not_to include(@new_book)
  end

  it 'should list all books by subject' do
    expect(@books.all_books_by_subject("Ruby")).to eq( 
      [{title: 'Learn Ruby The Hard Way', author: 'Zed Shaw', subject: 'Ruby'},
    {title: 'The Well Grounded Rubyist', author: 'Sandi Metz', subject: 'Ruby'}]
  )
  end
end
