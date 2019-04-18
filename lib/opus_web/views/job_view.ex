defmodule OpusWeb.JobView do
  use OpusWeb, :view
  alias OpusWeb.JobView

  def render("index.json", %{jobs: jobs}) do
    %{data: render_many(jobs, JobView, "job.json")}
  end

  def render("show.json", %{job: job}) do
    %{data: render_one(job, JobView, "job.json")}
  end

  def render("post.json", %{job: job}) do
    %{id: job.id,
      name: job.name,
      status: job.status}
  end
  def render("get.json", %{job: job}) do
    %{id: job.id,
      status: job.status}
  end
end
