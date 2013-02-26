require 'rubygems'
require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/app.db")

class Blog
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :body, Text
  property :submit_time, DateTime
  property :test, Text
end

DataMapper.finalize.auto_upgrade!

get '/' do
  @blogs = Blog.all order: :title.asc
  erb :index
end



get '/:id' do
  @blog = Blog.get params[:id]
  erb :view
end

post '/:id' do
  blog = Blog.new
  blog.title       = params[:title]
  blog.body        = params[:body]
  blog.submit_time = params[:submit_time]
  blog.save
end