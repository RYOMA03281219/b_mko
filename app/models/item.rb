class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :review, presence: true
  # validates :favorite, presence: true

  belongs_to :genre
  belongs_to :customer

  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('./app/assets/images/noimage.jpg')
      image.attach(io:File.open(file_path), filename: 'noimage.jpg',content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
