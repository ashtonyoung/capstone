class Post < ApplicationRecord
  enum :emotion, [:positive, :neutral, :negative]

  belongs_to :chapter
end
