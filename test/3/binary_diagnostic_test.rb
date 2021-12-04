# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/3/binary_diagnostic'

class BinaryDiagnosticTest < Minitest::Test

  def test_most_common_bit
    report = ["0", "1", "0"]
    mcb = BinaryDiagnostic.most_common_bit(report)
    assert_equal "0", mcb

    report = ["0", "1", "0", "1", "1"]
    mcb = BinaryDiagnostic.most_common_bit(report)
    assert_equal "1", mcb
  end

  def test_most_common_bits
    report = ["01", "00", "01"]
    mcbs = BinaryDiagnostic.most_common_bits(report)
    assert_equal "01", mcbs
  end
end