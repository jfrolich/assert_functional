defmodule AssertFunctional do
  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)
    end
  end

  defmacro assert_equal(val1, val2) do
    quote do
      assert(unquote(val1) == unquote(val2))
    end
  end

  defmacro assert_match(val1, val2) do
    quote do
      assert(unquote(val2) = unquote(val1))
    end
  end
end
