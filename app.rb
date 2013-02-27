require 'rubygems'
require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/app.db")

class Post
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :body, Text
  property :submit_time, Text
  property :test, Text
end

DataMapper.finalize.auto_upgrade!

get '/blog' do
  @posts = Post.all order: :id.asc
  erb :blog
end

get '/posts' do
  @posts = Post.all order: :title.asc
  erb :index
end

get '/posts/new' do
  erb :new
end

get '/posts/:id' do
  @post = Post.get params[:id]
  erb :show
end

get '/posts/:id/edit' do
  @post = Post.get params[:id]
  erb :edit
end

post '/posts/create' do
  post = Post.new
  post.title       = params[:title]
  post.body        = params[:body]
  post.submit_time = params[:submit_time]
  post.save
  redirect "/posts/#{post.id}"
end

post '/posts/:id/update' do
  post = Post.get params[:id]
  post.title       = params[:title]
  post.body        = params[:body]
  post.submit_time = params[:submit_time]
  post.save
  redirect "/posts/#{post.id}"
end