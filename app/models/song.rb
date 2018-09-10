class Song < ActiveRecord::Base
  validates :artist_name, presence: true, if: :did_release?
  validates :title, :genre, presence: true
  validates :title, uniqueness: true, if: :same_year?
  validates :release_year, presence: true, numericality: {less_than_or_equal_to: Time.now.year.to_i}, if: :did_release?
  validates :release_year, presence: false, if: :did_not_release?
  
  def did_release?
    released == true
  end

  def did_not_release?
    released == false
  end
#  title Cannot be repeated by the same artist in the same year
  def same_year? 
    same_year_songs = Song.all.select{|song| song.release_year == release_year}
    same_year_songs.select!{|song| song.title == title}
    !same_year_songs.nil?
  end
end
