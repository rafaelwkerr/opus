defmodule OpusWeb.JobController do
  use OpusWeb, :controller
  alias Opus.Works


  def create(conn, %{"job" => job_params}) do
    with {:ok, jid} <- Works.create_job(job_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.job_path(conn, :show, jid))
      |> render("post.json", job: %{id: jid, name: job_params["name"], status: "created"})
    end
  end

  def schedule(conn, %{"job" => job_params}) do
    with {:ok, jid} <- Works.schedule_job(job_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.job_path(conn, :show, jid))
      |> render("post.json", job: %{id: jid, name: job_params["name"], status: "scheduled"})
    end
  end

  def show(conn, %{"id" => id}) do
    with [ok: status] <- Works.get_job_status(id) do
      case status do
        :running -> render(conn, "get.json", job: %{id: id, status: "running"})
      end
    end
    render(conn, "get.json", job: %{id: id, status: "completed"})
  end

end
