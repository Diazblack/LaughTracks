class Special < ActiveRecord::Base
  validates_presence_of :name, :run_time_length, :year, :comedian_id

  belongs_to :comedian

  def self.time_length_average
    average(:run_time_length).round(2)
  end

  def self.all_count
    all.count
  end
end
