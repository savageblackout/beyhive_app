class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :embed_url, uniqueness: true, presence: true
  validates :title, presence: true

  def youtube_link
    "https://youtu.be/#{self.embed_url}"
  end

  def embed_link
    "https://www.youtube.com/embed/#{self.embed_url}"
  end

  # def image_embed_link
  #   "https://www.youtube.com/embed/#{self.embed_url}"
  # end

end
