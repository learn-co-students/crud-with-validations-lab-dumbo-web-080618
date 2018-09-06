class Song < ActiveRecord::Base
  validates :title, presence: true
  # Cannot be repeated by the same artist in the same year
  validates :title, uniqueness: {
    scope: %i[release_year artist_name],
    message: 'cannot be repeated by the same artist in the same year'
  }
  validates :released, inclusion: {
    in: [true, false]
  }

  validates :release_year, absence:true, unless: :released?

  with_options if: :released? do |song|
    song.validates :release_year, presence:true
    song.validates :release_year, length: { is: 4 }
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  def released?
    released
  end

  validates :artist_name, presence:true

end
