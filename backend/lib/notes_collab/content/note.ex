defmodule NotesCollab.Content.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
