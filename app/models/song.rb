
class Song < ActiveRecord::Base
   # Song is invalid if an artist tries to release the same song twice in a year

  # 2) Song is invalid if an artist tries to release the same song twice in a year


  validates :title, presence: true
  # validate :song_repetition
  # validates :release_year, presence: true, if: { released: true }
  validates :title, uniqueness: { scope: :release_year, allow_blank: true, message: "Can only release one song with the same title a year"}
  validate :release_year_presence
  validates :release_year, numericality: {less_than_or_equal_to: Date.today.year }, allow_blank: true
  validates :artist_name, presence: true


  def song_repetition
     a = Song.all.select do |m| (m.title == self.title) && (m.release_year == self.release_year)
     end
       if a.length >= 2
      # Song.find_by(title: self.title, release_year: self.release_year)
      # binding.pry
      self.errors.add(:title, "Song already added")
    end
  end



  def release_year_presence
    if released == true && !(release_year.present?)
      errors.add(:release_year, "Must have a release year")
    end
  end


end


# title, a string
#   Must not be blank

# Cannot be repeated by the same artist in the same year

# released, a boolean describing whether the song was ever officially released.
  # Must be true or false

# release_year, an integer
  # Optional if released is false
  # Must not be blank if released is true
  # Must be less than or equal to the current year

# artist_name, a string
  # Must not be blank
  # genre, a string
