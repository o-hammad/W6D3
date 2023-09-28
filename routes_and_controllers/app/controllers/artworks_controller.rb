class ArtworksController < ApplicationController
    def index
        artworks_created = Artwork.where(artist_id: params[:user_id])
        artworks_viewed = Artwork.joins(:shared_viewers).where("artwork_shares.viewer_id = ?", params[:user_id])
        render json: artworks_created + artworks_viewed
    end 
    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            redirect_to artwork_url(artwork)
        else 
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end 
    end 
    def show
        artwork = Artwork.find(params[:id])
        if artwork
            render json: artwork
        else 
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end 
    end 
    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            redirect_to artwork_url(artwork)
        else 
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end 

        
    end 
    def destroy
    end
    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url,:artist_id)
    end 
end
