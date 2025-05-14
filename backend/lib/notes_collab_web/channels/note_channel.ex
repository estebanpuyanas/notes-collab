defmodule NotesCollabWeb.NoteChannel do
  use Phoenix.Channel
  # adjust if your context module is named differently
  alias NotesCollab.Content

  def join("note:" <> note_id, _params, socket) do
    send(self(), :after_join)
    {:ok, assign(socket, :note_id, note_id)}
  end

  def handle_info(:after_join, socket) do
    NotesCollabWeb.NotePresence.track(socket, socket.assigns.user_id || socket.channel_pid, %{})
    push(socket, "presence_state", NotesCollabWeb.NotePresence.list(socket))
    {:noreply, socket}
  end

  def handle_in("update_body", %{"body" => body}, socket) do
    # Persist the updated body; adjust based on your context API
    Content.update_note(%{id: socket.assigns.note_id, body: body})
    broadcast!(socket, "body_updated", %{body: body})
    {:noreply, socket}
  end
end
