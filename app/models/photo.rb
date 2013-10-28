class Photo < ActiveRecord::Base
  attr_accessible :owner_id, :url, :title

  validates :owner_id, :url, :title, :presence => true

  has_many :photo_taggings
  belongs_to(
    :owner,
    :foreign_key => :owner_id,
    :class_name => 'User'
  )

  has_many :tagged_users, through: :photo_taggings, source: :user

end
