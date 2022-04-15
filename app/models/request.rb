class Reqeuest < ApplicationRecord
  validates_presence_of :status
  enum status: %i[ encours accepted  refus]
  belongs_to :mission,   class_name: "Mission", foreign_key: "mission_id", optional: true
  belongs_to :freelancer,   class_name: "Freelancer", foreign_key: "freelancer_id", optional: true
end