class ReleasedValidator < ActiveModel::Validator   
    def validate(record)
        if record.released == true 
            if !(record.release_year.is_a? Integer)
                record.errors[:release_year] << "not an int"
            elsif (record.release_year > 2019)
                record.errors[:release_year] << "future, impossible"
            end 
        elsif record.released == false
            if !(record.release_year == nil)
                record.errors[:release_year] << "impossible, not relased yet"
            end 
        end 
        @songs = Song.all
        @artist_songs = @songs.select do |song|
            song.artist_name == record.artist_name
        end 
        @artist_songs.each do |song|
            if ((song.title == record.title) && (song.release_year == record.release_year))
                record.errors[:release_year] << "same song x2 this year"
            end 
        end 
    end 
end 
