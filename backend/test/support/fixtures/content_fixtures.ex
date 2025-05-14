defmodule NotesCollab.ContentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `NotesCollab.Content` context.
  """

  @doc """
  Generate a note.
  """
  def note_fixture(attrs \\ %{}) do
    {:ok, note} =
      attrs
      |> Enum.into(%{
        body: "some body"
      })
      |> NotesCollab.Content.create_note()

    note
  end
end
