defmodule Schedule do
    


    def enter_schedule_flow() do
        IO.puts("One moment while I fetch the schedule...")
        case Scraper.get_locations() do
            {:ok, locations} ->
                display_schedule(locations)
            :error ->
                IO.puts("An unexpected error occurred. Please try again.")
        end  
    end



    def display_schedule(locations) do
        # Prints list of schedules
        locations
        |> Enum.with_index(1)
        |> Enum.each(fn({game, index}) -> IO.puts " #{index} - #{game.opponent_name} #{game.game_date}" end)
    end

end
