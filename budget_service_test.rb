require "minitest/autorun"
require 'rr'
require 'date'
require_relative 'budget_service'
require_relative 'budget_repository'




class BudgetServiceTest < Minitest::Test
  def test_budget_can_return
    bs = BudgetRepository.new
    stub(bs).get_all{ prepared_data }
    start_time = Date.parse('20200501')
    end_time = Date.parse('20200531')
    result = BudgetService.new(bs).query(start_time: start_time, end_time: end_time)
    assert_equal result, 310
  end

  def test_query_one_day
    bs = BudgetRepository.new
    stub(bs).get_all{ prepared_data }
    start_time = Date.parse('20200501')
    end_time = Date.parse('20200501')
    result = BudgetService.new(bs).query(start_time: start_time, end_time: end_time)
    assert_equal result, 10
  end

  def test_query_3_days
    bs = BudgetRepository.new
    stub(bs).get_all{ prepared_data }
    start_time = Date.parse('20200501')
    end_time = Date.parse('20200503')
    result = BudgetService.new(bs).query(start_time: start_time, end_time: end_time)
    assert_equal result, 30
  end

  def test_over_one_month
    bs = BudgetRepository.new
    stub(bs).get_all{ prepared_data }
    start_time = Date.parse('20200501')
    end_time = Date.parse('20200615')
    result = BudgetService.new(bs).query(start_time: start_time, end_time: end_time)
    assert_equal result, 4910
  end

  def test_over_two_month
    bs = BudgetRepository.new
    stub(bs).get_all{ prepared_data }
    start_time = Date.parse('20200531')
    end_time = Date.parse('20200701')
    result = BudgetService.new(bs).query(start_time: start_time, end_time: end_time)
    assert_equal result, 3011
  end

  # private

  def prepared_data
    {
        '201912' => 310,
        '202001' => 31,
        '202004' => 0,
        '202005' => 310,
        '202006' => 3000,
        '202007' => 31,
    }
  end

end
