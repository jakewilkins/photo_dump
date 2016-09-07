defmodule PhotoDump.PhotoView do
  use PhotoDump.Web, :view

  def render("index.json", %{photos: photos}) do
    %{data: render_many(photos, PhotoDump.PhotoView, "photo.json")}
  end

  def render("show.json", %{photo: photo}) do
    %{data: render_one(photo, PhotoDump.PhotoView, "photo.json")}
  end

  def render("photo.json", %{photo: photo}) do
    %{id: photo.id,
      name: photo.name,
      lat_long: photo.lat_long,
      taken_at: photo.taken_at}
  end
end
