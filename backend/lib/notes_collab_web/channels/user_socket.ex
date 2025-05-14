# backend/lib/notes_collab_web/channels/user_socket.ex
defmodule NotesCollabWeb.UserSocket do
  use Phoenix.Socket
  use Absinthe.Phoenix.Socket, schema: NotesCollabWeb.Schema

  ## Channels
  channel("note:*", NotesCollabWeb.NoteChannel)

  # connect and id stay the same
  def connect(_params, socket, _connect_info), do: {:ok, socket}
  def id(_socket), do: nil
end
