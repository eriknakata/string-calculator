defmodule StringCalculatorTest do
  use ExUnit.Case

  describe "given an empty string" do
    test "return zero" do
      assert StringCalculator.add("") == 0
    end
  end

  describe "given an string of numbers separated by comma" do
    test "return the sum of numbers" do
      assert StringCalculator.add("1") == 1
    end

    test "return the sum of tow numbers" do
      assert StringCalculator.add("1,2") == 3
    end

    test "return the sum of unknown amount of numbers" do
      assert StringCalculator.add("1,2,3,4") == 10
    end
  end
end
