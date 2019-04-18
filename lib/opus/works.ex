defmodule Opus.Works do
  alias Opus.Works.Job

  def create_job(attrs) do
    IO.inspect attrs
    Exq.enqueue(Exq, "jobs", Job, [attrs["name"], attrs["input"]])
  end

  def schedule_job(attrs) do
    IO.inspect time = attrs["time"]
    Exq.enqueue_in(Exq, "jobs", time, Job, [attrs["name"], attrs["input"]])
  end

end
