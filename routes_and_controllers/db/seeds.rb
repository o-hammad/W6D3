# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
    Artwork.destroy_all
    User.destroy_all
    ArtworkShare.destroy_all

    %w(users artworks artwork_shares).each do |table_name|
        ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end

    u1 = User.create!(username: "Balaji")
    u2 = User.create!(username: "Omar")
    u3 = User.create!(username: "Peter")
    u4 = User.create!(username: "Amin")
    u5 = User.create!(username: "Clarence")
    u6 = User.create!(username: "Stephen")
    u7 = User.create!(username: "Mark")
    u8 = User.create!(username: "David")

    aw1 = Artwork.create!(title: 'Mona Lisa', image_url: 'www.mona-lisa.com', artist: u1)
    aw2 = Artwork.create!(title: 'The Scream', image_url: 'www.scream.com', artist: u2)
    aw3 = Artwork.create!(title: 'Lazy Sunday', image_url: 'www.lazy-sunday.com', artist: u3)
    aw4 = Artwork.create!(title: 'Happy Times', image_url: 'www.happy-times.com', artist: u4)
    aw5 = Artwork.create!(title: 'Scarface', image_url: 'www.scarface.com', artist: u1)
    aw6 = Artwork.create!(title: 'Dancing', image_url: 'www.dancing.com', artist: u2)
    aw7 = Artwork.create!(title: 'Superman', image_url: 'www.superman.com', artist: u3)
    aw8 = Artwork.create!(title: 'Batman', image_url: 'www.batman.com', artist: u4)

    aw_s1 = ArtworkShare.create!(artwork: aw1, viewer: u5)
    aw_s2 = ArtworkShare.create!(artwork: aw1, viewer: u6)
    aw_s3 = ArtworkShare.create!(artwork: aw2, viewer: u7)
    aw_s4 = ArtworkShare.create!(artwork: aw2, viewer: u8)
    aw_s5 = ArtworkShare.create!(artwork: aw3, viewer: u5)
    aw_s6 = ArtworkShare.create!(artwork: aw3, viewer: u6)
    aw_s7 = ArtworkShare.create!(artwork: aw4, viewer: u7)
    aw_s8 = ArtworkShare.create!(artwork: aw4, viewer: u8)
end
