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

  describe "given an string of numbers separated by comma and new_line" do
    test "return the sum of numbers" do
      assert StringCalculator.add("1\n2,3") == 6
    end
  end

  describe "given an string of numbers with a custom delimiter" do
    test "return the sum of numbers" do
      assert StringCalculator.add("//;\n1;2") == 3
    end
  end

  describe "given an string with negative numbers" do
    test "display a message with the negative number" do
      assert_raise RuntimeError, "negatives not allowed -3", fn ->
        StringCalculator.add("1,2,-3,4") == 10
      end
    end

    test "display a message with the negative numbers" do
      assert_raise RuntimeError, "negatives not allowed -3,-4", fn ->
        StringCalculator.add("1,2,-3,-4") == 10
      end
    end
  end
end
