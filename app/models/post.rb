class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

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




  def has_image?
    self.photo.present?
  end

  def has_text?
    self.text_post.present?
  end

  def has_video?
    self.embed_url.present?
  end

  # def image_or_text_or_video
  #   if !has_text? && !has_image? && !has_video?
  #     errors.add :image_or_text_or_video, "must exist."
  #   end
  # end

  # def formatted_time
  #   created_at.strftime("%b %-d, %Y")
  # end

end
