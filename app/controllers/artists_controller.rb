class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    pre = Preference.all.first
      if !!pre.allow_create_artists
    @artist = Artist.new
      else
        redirect_to artists_path
      end 
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to @artist
    else
     redirect_to admin_new_artist
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    @artist.update(artist_params)

    if @artist.save
      redirect_to @artist
    else
      redirect_to admin_edit_artist
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    flash[:notice] = "Artist deleted."
    redirect_to admin_artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
end
