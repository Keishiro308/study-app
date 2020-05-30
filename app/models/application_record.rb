class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def save_tags(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    deleted_tags = current_tags - tags
    added_tags = tags - current_tags

    deleted_tags.each do |tag|
      self.tags.delete Tag.find_by(name: tag)
    end

    added_tags.each do |tag|
      new_tag = Tag.find_or_create_by(name: tag)
      self.tags << new_tag
    end
  end
end
