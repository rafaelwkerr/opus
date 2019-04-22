defmodule Opus.Works.Jobs.Fibonacci do
  def calc(a, _, 0 ) do a end
  def calc(a, b, n) do
    calc(b, a+b, n-1)
  end
end
