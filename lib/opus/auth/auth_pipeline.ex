defmodule Opus.Auth.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :opus_app,
  module: Opus.Guardian,
  error_handler: Opus.Auth.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
