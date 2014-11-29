require 'json'

class Post
  def initialize posts
    @data = posts
  end

  def self.load path
    data = JSON.parse(File.open(path, "r").read)["posts"]
    data.each do |post|
      post["tags"] = post["tags"].tr(' ', '').split(',')
    end
    Post.new data
  end

  def data
    @data
  end

  def count
    @data.count
  end

  def find_by_id id
    @data.each do |item|
      if item["id"].to_i == id
        return item
      end
    end
  end

  def find_by_author author
    posts = []
    @data.each do |item|
      if item["author"] == author
        posts.push item
      end
    end
    posts
  end
  
  def find_by_tag tag
    posts = []
    @data.each do |item|
      if item["tags"].include? tag
        posts.push item
      end
    end
    return posts
  end

  def get_tags
    tags = []
    @data.each do |item|
      item["tags"].each do |tag|
        tags.push tag unless tags.include? tag
      end
    end
    return tags
  end
  
  def description_preview id
    post = self.find_by_id id
    post["description"].split(' ')[0,10].join(' ')
  end
end
