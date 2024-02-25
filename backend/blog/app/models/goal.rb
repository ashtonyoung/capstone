class Goal < ApplicationRecord
  enum :status, [:todo, :in_progress, :achieved]
end
