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

  def get_job_status(id) do
    job_pid = Application.get_env(:exq, :name) |> Exq.Api.Server.server_name
    {:ok, processes} = Exq.Api.processes(job_pid)

    status = for p <- processes do
      p.job
      |> Poison.decode!
      |> Map.get("jid")
      |> case do
        id-> {:ok, :running}
      end
    end
    status
  end

end
