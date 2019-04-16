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
                            |> Enum.map(&extract_opponent_date_score/1)
                            |> Enum.sort(&(&1.name < &2.name))

                        {:ok, locations}   

                    _ -> :error
                end
            _ -> :error
        end
    end
    
    defp extract_opponent_date_score({_tag, children}) do
      {_, _, [game_date]} =
          Floki.raw_html(children)
          |> Floki.find(".sidearm-schedule-game-opponent-date")
          |> hd()

      {_, _, [opponent_name]} =
          Floki.raw_html(children)
          |> Floki.find("sidearm-schedule-game-opponent-name a")
          |> hd()

      %{game_date: game_date, opponent_name: opponent_name}

    end



end
