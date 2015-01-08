class Article
  include Mongoid::Document
  field :name, type: String
  field :content, type: String
  field :published_on, :type => Date
  validates_presence_of :name, :content
  embeds_many :comments
  embedded_in :user
  #referenced_in :author
end