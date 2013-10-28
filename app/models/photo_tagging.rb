class PhotoTagging < ActiveRecord::Base
  attr_accessible :user_id, :photo_id, :x_pos, :y_pos

  validates :user_id, :photo_id, :x_pos, :y_pos, :presence => true

  belongs_to :photo
  belongs_to :user
end
