defmodule Opus.Works do
  alias Opus.Works.Job

  def create_job(job) do
    Exq.enqueue(Exq, "jobs", Job, [job["name"], job["input"]])
  end

  def schedule_job(job) do
    Exq.enqueue_in(Exq, "jobs", job["time"], Job, [job["name"], job["input"]])
  end

  def get_job_status(id) do
    job_pid = Application.get_env(:exq, :name) |> Exq.Api.Server.server_name
    {:ok, processes} = Exq.Api.processes(job_pid)

    status = for p <- processes do
      p.job
      |> Poison.decode!
      |> Map.get("jid")
      |> case do
        id -> {:ok, :running}
      end
    end
    IO.inspect status
  end

end
