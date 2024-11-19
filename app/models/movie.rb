# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  validates(:director_id, presence: true)
  validates(:title, uniqueness: true)

  belongs_to(:director, class_name: "Director", foreign_key: "director_id")
  has_many(:characters, :class_name => "Character", :foreign_key => "movie_id")
  has_many(:cast, through: :characters, source: :actor)
  has_many(:filmography, through: :character, source: :movie)

end

def zebra
x = self.director_id

  matching_records = Director.where({ :id => x})
  y = matching_records.first

  return y #the row from the directors table
end
