class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: [true, false]}
  validates :artist_name, presence: true

  with_options if: :is_release? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end
  # validate :is_release?

  # validates :content, length: { minimum: 250 }
  # validates :summary, length: {maximum: 250}
  # validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  # validate :is_clickbait?
  #
  # def is_clickbait?
  #   if [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i].none? { |pat| pat.match title }
  #     errors.add(:title, "must be clickbait")
  #   end
  # end
  def is_release?
    released
  end
end
