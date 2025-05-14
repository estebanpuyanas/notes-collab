defmodule NotesCollabWeb.HomeController do
  use NotesCollabWeb, :controller

  def index(conn, _params) do
    text(conn, "NotesCollab API is alive!")
  end
end
