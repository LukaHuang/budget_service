require "minitest/autorun"
require "mocha/minitest"
require_relative 'budget_service'

class BudgetServiceTest < Minitest::Test
  def test_budget_can_return
    result = BudgetService.new.query(start_time: '20200501', end_time: '20200531')
    assert_equal result, 310
  end



end
