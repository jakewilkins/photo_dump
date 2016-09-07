defmodule PhotoDump.Repo.Migrations.CreatePhoto do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :caption, :string
      add :location, :string

      add :uuid, :string

      add :checksum, :string

      add :map_image_url, :string
      add :map_url, :string
      add :ifttt_photo_url, :string
      add :ifttt_share_url, :string

      add :taken_at, :datetime

      timestamps()
    end

  end
end
