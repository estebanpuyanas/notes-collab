defmodule NotesCollab.Repo do
  use Ecto.Repo,
    otp_app: :notes_collab,
    adapter: Ecto.Adapters.Postgres
end
