class Song < ActiveRecord::Base
  validates :title, presence:true
  validate :same_artist_same_year
  validates :released, inclusion: {in: [true, false]}
  validate :check_release_year
  validates :artist_name, presence:true


  def same_artist_same_year
    if Song.find_by(title: self.title, artist_name: self.artist_name, release_year: self.release_year)
      errors.add(:title, "cannot be by the same artist in the same year")
    end
  end

  def check_release_year
    if self.released
      if release_year == nil
        errors.add(:release_year, "release year cannot be empty when released")
      elsif release_year > Date.today.year
        errors.add(:release_year, "release year cannot be greater than current year")
      end
    end
  end
end
