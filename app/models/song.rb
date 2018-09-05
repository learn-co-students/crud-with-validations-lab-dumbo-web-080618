class Song < ActiveRecord::Base

  validates :title, presence: true
  validate :release_valid
  validates :released, inclusion: { in: [true, false]}
  validates :artist_name, presence: true
  validates :title, uniqueness: {scope: [:release_year, :artist_name],
    message: "cannot be repeated by the same artist in the same year"
  }

  def release_valid
    if released && !release_year
      errors.add(:release_year, "must have a value")
      self.errors.full_messages
    elsif released && release_year > Date.today.year
      errors.add(:release_year, "must be less than or equal to this year")
    end
  end

    # <%= f.object.errors.full_messages.join(", ") if f.object.errors.any? %>

  # with_options if: :is_release? do |song|
  #   song.validates :release_year, presence: true
  #   song.validates :release_year, numericality: {
  #     less_than_or_equal_to: Date.today.year
  #   }
  # end
  # def is_release?
  #   released
  # end

end
