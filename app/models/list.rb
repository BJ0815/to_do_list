class List < ApplicationRecord
  validates_presence_of :title, :date, :note

end
