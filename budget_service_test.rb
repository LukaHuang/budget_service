require "minitest/autorun"
require 'rr'
require 'date'
require_relative 'budget_service'
require_relative 'budget_repository'




class BudgetServiceTest < Minitest::Test
  def test_budget_can_return
    bs = BudgetRepository.new
    stub(bs).get_all{ prepared_data }

    #dao = database.expects(:get_all).returns(prepared_data)
    start_time = DateTime.new(20200501)
    end_time = DateTime.new(20200531)
    result = BudgetService.new(bs).query(start_time: start_time, end_time: end_time)
    assert_equal result, 310
  end

  # def test_query_one_day
  #
  #   # result = BudgetService.new(mock_database).query(start_time: '20200501', end_time: '20200501')
  #   # assert_equal result, 10
  # end


  # private

  def prepared_data
    {
        '201912' => 310,
        '202001' => 31,
        '202004' => 0,
        '202005' => 310,
        '202006' => 3000,
        '202007' => 3,
    }
  end

end
