class Api::PhotosController < ApplicationController
  #before_filter :require_current_user!

  def index
    @photos = Photo.find_all_by_owner_id(params[:user_id])
    render json: @photos, status: :ok
  end

  def show
    @photo = Photo.find(params[:id])
    if @photo
      render json: @photo, status: :ok
    else
      render json: { error: "No photo found" }, status: :not_found
    end
  end

  def create
    p "hello"
    photo = Photo.new(params[:photo])
    if photo.save
      render json: photo, status: :ok
    else
      render json: photo.errors.full_messages, status: :unprocessable_identity
    end
  end

  def update
    photo = Photo.find(params[:id])
    if photo.update_attributes(params[:photo])
      render json: photo, status: :ok
    else
      render json: photo.errors.full_messages, status: :unprocessable_identity
    end
  end
end