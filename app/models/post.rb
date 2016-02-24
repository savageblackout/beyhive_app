class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validate :image_or_text_or_video

  def youtube_link
    "https://youtu.be/#{self.embed_url}"
  end

  def embed_link
    "https://www.youtube.com/embed/#{self.embed_url}"
  end


  # def has_image?
  #   photo_url && !photo_url.empty?
  # end

  # def has_text?
  #   text && !text.empty?
  # end

  # def has_video?
  #   embed_url && !embed_url.empty?
  # end

  # def image_or_text_or_video
  #   if !has_text? && !has_image? && !has_video?
  #     errors.add :image_or_text_or_video, "must exist."
  #   end
  # end

  # def formatted_time
  #   created_at.strftime("%b %-d, %Y")
  # end

end
