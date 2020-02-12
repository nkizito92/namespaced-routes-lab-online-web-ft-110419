class Admin::PreferencesController < ApplicationController

    def index 
        @artist = Artist.count
        @songs = Song.All
    end 
end 