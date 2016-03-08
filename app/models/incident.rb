class Incident < ActiveRecord::Base
    belongs_to :incident_category
    belongs_to :user

    validates :priority, presence: true
    validates :subject, presence: true
    validates :location_of_incident, presence: true
    validates :time_of_incident, presence: true
    validates :progress, presence: true
    validates :incident_category, presence: true
    
    def getPriority priority
      if !priority.is_a? Numeric
        0
      else
        priority
      end
    end

    def getProgress progress
      if !progress.is_a? Numeric
        "Unknown"
      elsif progress <= 0
        "Reported"
      elsif progress == 1
        "Processing"
      elsif progress == 2
        "In Progress"
      elsif progress >= 3
        "Resolved"
      end
    end
end
