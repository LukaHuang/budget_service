require 'date'

class BudgetService
  attr_accessor :start_time
  attr_accessor :end_time
  def initialize()
  end

  def query(start_time:, end_time:)
    @start_time = start_time
    @end_time = end_time
    return 310
  end

end
