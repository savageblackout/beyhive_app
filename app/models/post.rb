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

  def photo_url
    "https://www.imgur.com/#{self.photo_url}"
  end

  def fragment_id
    "picture-#{self.id}"
  end

  # require 'date'

  # date_string = '09-02-2012 20:05:33'

  # datetime = DateTime.parse(date_string)
  # puts datetime
  # puts DateTime.strptime(date_string, '%m-%d-%Y %H:%M:%S')

end
