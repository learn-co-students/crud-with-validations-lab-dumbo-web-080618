class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :release_year, presence: true,
    unless: Proc.new {|a| a.released == false}
  validates :release_year, numericality: {less_than: Time.now.year.to_i},
    unless: Proc.new {|a| a.released == false}

end
