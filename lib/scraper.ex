defmodule Scraper do

    @doc """
    Fetch a list of all of the Hale and Hearty locations.
    """
    def get_locations() do
        case HTTPoison.get("https://minesathletics.com/schedule.aspx?path=softball") do
            {:ok, response} ->
                case response.status_code do
                    200 ->
                        locations = 
                            response.body
                            |> Floki.find(".sidearm-schedule-game-row")
                            |> Enum.map(&extract_location_name_and_id/1)
                            |> Enum.sort(&(&1.name < &2.name))

                        {:ok, locations}   

                    _ -> :error
                end
            _ -> :error
        end
    end

end
