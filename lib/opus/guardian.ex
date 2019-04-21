defmodule Opus.Guardian do
  use Guardian, otp_app: :opus_app

  def subject_for_token(id, _claims) do
    sub = to_string(id)
    IO.inspect sub
    {:ok, sub}
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    {:ok, conn} = Redix.start_link(host: "172.17.0.2", port: 6379)
    result_redix = Redix.command(conn, ["GET", id])
    {:ok,  result_redix}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end

end
