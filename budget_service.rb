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
    start_year = start_time.strftime("%Y")
    end_year = end_time.strftime("%Y")
    start_month = start_time.strftime("%m")
    end_month = end_time.strftime("%m")
    days = (end_time - start_time).to_i + 1
    if start_month == end_month
      puts "days #{days}"
      current_year_month = start_time.strftime("%Y%m")[0..5]
      return data[current_year_month] * days / 31
    else
      days_of_start_month =  (Date.civil( start_year.to_i, start_month.to_i,-1) - start_time).to_i + 1
      days_of_end_month =  (end_time - Date.civil( start_year.to_i, start_month.to_i,1) ).to_i + 1
      totol_day_of_start_month = (Date.civil( start_year.to_i, start_month.to_i,-1) - Date.civil( start_year.to_i, start_month.to_i,1)).to_i + 1
      totol_day_of_end_month = (Date.civil( end_month.to_i, end_month.to_i,-1) - Date.civil( end_month.to_i, end_month.to_i,1)).to_i + 1
      # days_of__month =  Date.civil( start_year, start_month,-1) - start_time
      budget_of_start =  data[ start_time.strftime("%Y%m")[0..5] ]
      budget_of_end = data[ end_time.strftime("%Y%m")[0..5] ]
      puts budget_of_end * days_of_end_month / totol_day_of_end_month
      puts budget_of_start / totol_day_of_start_month * days_of_start_month
      return budget_of_start / totol_day_of_start_month * days_of_start_month + budget_of_end * days_of_end_month / totol_day_of_end_month
    end
  end

end
