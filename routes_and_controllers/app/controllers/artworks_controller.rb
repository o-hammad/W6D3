class ArtworksController < ApplicationController
    def index
        artwork = Artwork.all
        render json: artwork
    end 
    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            redirect_to artwork_url(artwork)
        else 
            render json: artwork.errors_full_messages, status: :unprocessable_entity
        end 
    end 
    def show
        artwork = Artwork.find(params[:id])
        if artwork
            render json: artwork
        else 
            render json: artwork.errors_full_messages, status: :unprocessable_entity
        end 
    end 
    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            redirect_to artwork_url(artwork)
        else 
            render json: artwork.errors_full_messages, status: :unprocessable_entity
        end 

        
    end 
    def destroy
    end 
    def artwork_params
        params.require(:artwork).permit(:title, :image_url,:artist_id)
    end 
end
