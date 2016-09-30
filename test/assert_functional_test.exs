defmodule AssertFunctionalTest do
  use ExUnit.Case
  doctest AssertFunctional
  use AssertFunctional

  test "assert_equal with non-equality" do
    try do
      assert_equal(1,2)
    rescue
      error in [ExUnit.AssertionError] ->
        "1 == 2" = error.expr |> Macro.to_string
        "Assertion with == failed" = error.message
    end
  end

  test "assert_equal with equality" do
    assert_equal(1,1)
  end

  test "assert_match" do
    try do
      assert_match(%{foo: 1, bar: 2},%{foo: 2})
    rescue
      error in [ExUnit.AssertionError] ->
        "%{foo: 2} = %{foo: 1, bar: 2}" = error.expr |> Macro.to_string
        "match (=) failed" = error.message
    end
  end

  test "assert_match with match" do
     assert_match(%{foo: 1, bar: 2},%{foo: 1})
  end
end
