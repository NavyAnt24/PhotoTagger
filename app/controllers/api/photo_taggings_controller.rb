class Api::PhotoTaggingsController < ApplicationController
  before_filter :require_current_user!
  before_filter :require_photo_owner!, only: [:create]

  def index
    @photo_taggings = PhotoTagging.find_all_by_photo_id(params[:photo_id])
    render json: @photo_taggings, status: :ok
  end

  def create
    photo_tagging = PhotoTagging.new(params[:photo_tagging])
    if photo_tagging.save
      render json: photo_tagging, status: :ok
    else
      render json: photo_tagging.errors.full_messages, status: :unprocessable_identity
    end
  end

  private
  def require_photo_owner!
    photo = Photo.find(params[:photo_tagging][:photo_id])
    if !photo || photo.owner_id != current_user.id
      redirect_to root
    end
  end
end