defmodule Opus.JobsTest do
  use ExUnit.Case
  alias Opus.Works.Jobs

  test "fibonacci calc" do
    assert Jobs.Fibonacci.calc(0, 2, 10) == 110
  end

  test "factorial calc" do
    assert Jobs.Factorial.of(5) == 120
  end

end
