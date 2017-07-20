class Photo < ApplicationRecord
  validates :user_id, presence: true  
  validates :image, presence: true
  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  has_many :comments, dependent: :destroy

  def self.search(keyword)
    if keyword
      find(:all, :conditions => ['name LIKE ?', "%#{keyword}%"])
    end
  end
end
