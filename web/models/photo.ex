defmodule PhotoDump.Photo do
  use PhotoDump.Web, :model

  schema "photos" do
    field :caption, :string
    field :location, :string

    field :uuid, :string

    field :checksum, :string

    field :map_image_url, :string
    field :map_url, :string
    field :ifttt_photo_url, :string
    field :ifttt_share_url, :string

    field :taken_at, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :lat_long, :taken_at])
    |> validate_required([:name, :lat_long, :taken_at])
  end
end
