defmodule PhotoDump.PhotoController do
  use PhotoDump.Web, :controller

  alias PhotoDump.Photo

  def index(conn, _params) do
    photos = Repo.all(Photo)
    render(conn, "index.json", photos: photos)
  end

  def create(conn, %{"photo" => photo_params}) do
    changeset = Photo.changeset(%Photo{}, photo_params)

    case Repo.insert(changeset) do
      {:ok, photo} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", photo_path(conn, :show, photo))
        |> render("show.json", photo: photo)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhotoDump.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def create(conn, photo_params) do
    IO.inspect(photo_params)
  end

  def show(conn, %{"id" => id}) do
    photo = Repo.get!(Photo, id)
    render(conn, "show.json", photo: photo)
  end

  def update(conn, %{"id" => id, "photo" => photo_params}) do
    photo = Repo.get!(Photo, id)
    changeset = Photo.changeset(photo, photo_params)

    case Repo.update(changeset) do
      {:ok, photo} ->
        render(conn, "show.json", photo: photo)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhotoDump.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    photo = Repo.get!(Photo, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(photo)

    send_resp(conn, :no_content, "")
  end
end
