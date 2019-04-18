defmodule Opus.WorksTest do
  use Opus.DataCase

  alias Opus.Works

  describe "jobs" do
    alias Opus.Works.Job

    @valid_attrs %{input: 42, name: "some name", status: "some status"}
    @update_attrs %{input: 43, name: "some updated name", status: "some updated status"}
    @invalid_attrs %{input: nil, name: nil, status: nil}

    def job_fixture(attrs \\ %{}) do
      {:ok, job} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Works.create_job()

      job
    end

    test "list_jobs/0 returns all jobs" do
      job = job_fixture()
      assert Works.list_jobs() == [job]
    end

    test "get_job!/1 returns the job with given id" do
      job = job_fixture()
      assert Works.get_job!(job.id) == job
    end

    test "create_job/1 with valid data creates a job" do
      assert {:ok, %Job{} = job} = Works.create_job(@valid_attrs)
      assert job.input == 42
      assert job.name == "some name"
      assert job.status == "some status"
    end

    test "create_job/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Works.create_job(@invalid_attrs)
    end

    test "update_job/2 with valid data updates the job" do
      job = job_fixture()
      assert {:ok, %Job{} = job} = Works.update_job(job, @update_attrs)
      assert job.input == 43
      assert job.name == "some updated name"
      assert job.status == "some updated status"
    end

    test "update_job/2 with invalid data returns error changeset" do
      job = job_fixture()
      assert {:error, %Ecto.Changeset{}} = Works.update_job(job, @invalid_attrs)
      assert job == Works.get_job!(job.id)
    end

    test "delete_job/1 deletes the job" do
      job = job_fixture()
      assert {:ok, %Job{}} = Works.delete_job(job)
      assert_raise Ecto.NoResultsError, fn -> Works.get_job!(job.id) end
    end

    test "change_job/1 returns a job changeset" do
      job = job_fixture()
      assert %Ecto.Changeset{} = Works.change_job(job)
    end
  end
end
