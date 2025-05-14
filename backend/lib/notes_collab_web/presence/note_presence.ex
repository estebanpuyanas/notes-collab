defmodule NotesCollabWeb.NotePresence do
  use Phoenix.Presence,
    otp_app: :notes_collab,
    pubsub_server: NotesCollab.PubSub
end
