class Special < ActiveRecord::Base
  validates_presence_of :name, :run_time_length, :year, :comedian_id

  belongs_to :comedian
end
