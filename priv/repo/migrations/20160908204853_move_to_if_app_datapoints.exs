defmodule PhotoDump.Repo.Migrations.MoveToIfAppDatapoints do
  use Ecto.Migration

  def change do
    alter table(:photos) do
      rename(:caption, :album_name)
      #remove(:location)
      remove(:map_image_url)
      remove(:map_url)
      remove(:ifttt_share_url)
    end
  end
end
