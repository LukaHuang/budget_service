require 'date'

class BudgetService
  attr_accessor :start_time
  attr_accessor :end_time
  attr_accessor :dao
  def initialize(dao)
    @dao = dao
  end

  def query(start_time:, end_time:)
    @start_time = start_time
    @end_time = end_time
    data = dao.get_all
    start_month = start_time.strftime("%m")
    end_month = end_time.strftime("%m")
    # match = (end_time - start_time).to_s.match(/365\/(\d+)/)
    days = (end_time - start_time).to_i / 365 + 1
    puts "days #{days}"
    current_year_month = start_time.strftime("%Y%m")[0..5]
    return data[current_year_month] * days / 31

  end

end
