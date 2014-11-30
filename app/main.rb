require 'sinatra'
require './app/post'

get "/posts" do
  posts = Post.load './tests/posts.json'
  erb :posts, :locals => { posts: posts.data }
end

get "/posts/:id" do
  posts = Post.load './tests/posts.json'
  erb :post, :locals => { post: posts.find_by_id(params["id"].to_i) }
end

