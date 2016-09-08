defmodule PhotoDump.Photo do
  use PhotoDump.Web, :model

  schema "photos" do
    field :uuid, :string
    field :album_name, :string

    field :location, :string
    field :checksum, :string

    field :ifttt_photo_url, :string

    field :taken_at, Timex.Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> set_uuid(params)
    |> set_taken_at(params)
    |> cast(params, [:ifttt_photo_url, :album_name])
    |> validate_required([:uuid, :ifttt_photo_url, :taken_at])
  end

  defp set_uuid(struct, params = %{}) do
    uri = params["ifttt_photo_url"]
      |> URI.parse
    uuid = uri.path |> Path.basename(".jpg")
    %{struct | uuid: uuid}
  end

  defp set_taken_at(struct, params = %{}) do
    ts = params["taken_at"]
    case Timex.parse(params["taken_at"], "%B %d, %Y at %0l:%M%p", :strftime) do
      {:ok, parsed} -> %{struct | taken_at: parsed}
      {:error, wat} -> %{struct | taken_at: Timex.now()}
    end
  end
end
