class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validate :has_release_year?
  validate :not_future_release_year


  def has_release_year?
    if released && !release_year.present?
      errors.add(:released, "can't be released without release year")
    end
  end

  def not_future_release_year
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "can't have future release year")
    end
  end
end
