class BudgetService
  attr_accessor :start_time
  attr_accessor :end_time
  def initialize(start_time:, end_time:)
    @start_time = start_time
    @end_time = end_time
  end

end
