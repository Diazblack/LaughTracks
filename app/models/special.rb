class Special < ActiveRecord::Base
  validates_presence_of :name, :run_time_length, :year

  belongs_to :comedians
end
