class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list=(tags_by_comma)
    tags_by_comma.split(",").each do |tag|
      tag = Tag.find_or_create_by(name: tag.strip.downcase)
      tags << tag
    end
  end

end
