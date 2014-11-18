require 'minitest/autorun'
require './app/post'

class PostTest < MiniTest::Unit::TestCase

  def setup
    @post = Post.new
  end

  def test_post_can_locad_a_file
    @post.load "testfile.json"
    assert_equal 3, @post.count
  end

  def test_find_by_id
    post = @post.find_by_id 2
    assert_equal 2, post.id
  end

  def test_find_by_author
    posts = @post.find_by_author "Pixelated"
    assert_equal 2, posts.count
    assert_equal "Pixelated", posts[1].author
  end

  def test_find_by_tag
   posts = @post.find_by_tag "fitness"
   assert_equal 2, posts.count
   assert_includes posts, "fitness"
  end
  
  def test_get_tags
    tags = @post.get_tags
    assert_equal 4, tags.count
  end

  def test_description_preview
    post = @post.get_by_id 1
    assert_equal "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ornare", post.description_preview
  end
end
