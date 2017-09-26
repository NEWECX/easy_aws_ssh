require 'test_helper'

class EasyAwsSshTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::EasyAwsSsh::VERSION
  end
end
