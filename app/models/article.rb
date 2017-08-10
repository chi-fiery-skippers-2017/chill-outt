class Article < ApplicationRecord
  has_many :versions, class_name: "ArticleVersion"
  accepts_nested_attributes_for :versions

  validates_presence_of :title, :versions

  def latest_version
    versions.order("created_at").last
  end

  def prior_versions
    versions.order("created_at")[0..-2]
  end

  def self.featured
    Article.where(is_featured: true)
  end

  def self.search(param)
    Article.select { |article| article.title.downcase.include? param.downcase}
  end
end
