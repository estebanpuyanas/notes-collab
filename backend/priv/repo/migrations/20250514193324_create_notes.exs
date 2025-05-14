defmodule NotesCollab.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :body, :text

      timestamps()
    end
  end
end
