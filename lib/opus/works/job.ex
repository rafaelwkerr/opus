defmodule Opus.Works.Job do
  alias Opus.Works.Jobs.Fibonacci
  alias Opus.Works.Jobs.Factorial

  def perform(name, input) do
    exec = fn
            {"fibonacci", input} -> Fibonacci.calc(0, 1, input)
            {"factorial", input} -> Factorial.of(input)
          end
    exec.({name, input})
  end
end
