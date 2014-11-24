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
        item
      end
    end
  end
end
