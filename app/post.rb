require 'json'

class Post
  def load path
    @data = JSON.parse(File.open(path, "r").read)["posts"]
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
      if item["tags"].tr(' ', '').split(',').include? tag
        posts.push item
      end
    end
    return posts
  end

  def get_tags
    tags = []
    @data.each do |item|
      item["tags"].tr(" ", "").split(',').each do |tag|
        tags.push tag unless tags.include? tag
      end
    end
    return tags
  end
  
  def description_preview post
    #post = self.find_by_id id
    post["description"].split(' ')[0,10].join(' ')
  end
end
