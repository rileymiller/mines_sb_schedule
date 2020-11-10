defmodule Scraper do

    @doc """
    Fetch a list of all of the Mines Softball Games.
    """
    def get_locations() do
        case HTTPoison.get("https://minesathletics.com/sports/softball/schedule") do
            {:ok, response} ->
                case response.status_code do
                    200 ->
                            {:ok, html} = Floki.parse_document(response.body)
                            
                            locations = 
                            Floki.find(html, ".sidearm-schedule-game-row")
                            |> Enum.map(&extract_opponent_date/1)
                        {:ok, locations}   

                    _ -> :error
                end
            {:error, reason} ->
                IO.inspect reason
                :error
        end
    end
    
    defp extract_opponent_date({_tag, attrs, children}) do
      {_, _, [game_date]} =
          Floki.find(children,".sidearm-schedule-game-opponent-date flex-item-1, span")
          |> hd()

      {_, _, [opponent_name]} =
          Floki.find(children,".sidearm-schedule-game-opponent-name a")
          |> hd()
      {_, _, [game_time]} =
          Floki.find(children, ".sidearm-schedule-game-opponent-date flex-item-1, span:nth-child(2)")
          |> hd()

      %{game_date: game_date, opponent_name: opponent_name, game_time: game_time}

    end



end
