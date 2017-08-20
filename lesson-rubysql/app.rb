require 'sinatra'
require 'mysql2'

get '/' do
  client = Mysql2::Client.new(
    :host => 'localhost',
    :username => 'root',
    :database => 'booklist',
    :encoding => 'utf8'
    )
  @records = client.query("SELECT * FROM books ORDER BY created_at DESC")
  erb :booklist
end

post '/' do
  client = Mysql2::Client.new(
    :host => 'localhost',
    :username => 'root',
    :database => 'booklist',
    :encoding => 'utf8'
    )
    
  books_title = params["book_title"]
  statement = client.prepare("INSERT INTO books (book_title) VALUES(?)")
  statement.execute(books_title)
  
  @records = client.query("SELECT * FROM books ORDER BY created_at DESC")
    
  erb :booklist
end