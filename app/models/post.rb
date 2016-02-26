class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  validates_attachment :photo,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  def youtube_link
    "https://youtu.be/#{self.embed_url}"
  end

  def embed_link
    "https://www.youtube.com/embed/#{self.embed_url}"
  end

  def self.videos
    self.where "embed_url <> ''"
  end

  def self.photos
    self.where "photo_file_name IS NOT NULL"
  end

  def self.text_posts
    self.where "text_post <> ''"
  end

  def has_image?
    self.photo.present?
  end

  def has_text?
    self.text_post.present?
  end

  def has_video?
    self.embed_url.present?
  end

end
