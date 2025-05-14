defmodule NotesCollab.ContentTest do
  use NotesCollab.DataCase

  alias NotesCollab.Content

  describe "notes" do
    alias NotesCollab.Content.Note

    import NotesCollab.ContentFixtures

    @invalid_attrs %{body: nil}

    test "list_notes/0 returns all notes" do
      note = note_fixture()
      assert Content.list_notes() == [note]
    end

    test "get_note!/1 returns the note with given id" do
      note = note_fixture()
      assert Content.get_note!(note.id) == note
    end

    test "create_note/1 with valid data creates a note" do
      valid_attrs = %{body: "some body"}

      assert {:ok, %Note{} = note} = Content.create_note(valid_attrs)
      assert note.body == "some body"
    end

    test "create_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_note(@invalid_attrs)
    end

    test "update_note/2 with valid data updates the note" do
      note = note_fixture()
      update_attrs = %{body: "some updated body"}

      assert {:ok, %Note{} = note} = Content.update_note(note, update_attrs)
      assert note.body == "some updated body"
    end

    test "update_note/2 with invalid data returns error changeset" do
      note = note_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_note(note, @invalid_attrs)
      assert note == Content.get_note!(note.id)
    end

    test "delete_note/1 deletes the note" do
      note = note_fixture()
      assert {:ok, %Note{}} = Content.delete_note(note)
      assert_raise Ecto.NoResultsError, fn -> Content.get_note!(note.id) end
    end

    test "change_note/1 returns a note changeset" do
      note = note_fixture()
      assert %Ecto.Changeset{} = Content.change_note(note)
    end
  end
end
