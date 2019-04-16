defmodule Schedule.CLI do

    def main(argv) do
        argv
        |> parse_args()
        |> process()
    end

    def parse_args(argv) do
        args = OptionParser.parse(
            argv, 
            strict: [help: :boolean ], 
            alias: [h: :help]
        )

        case args do
            {[help: true], _, _} ->
                :help

            {[], [], [{"-h", nil}]} ->
                :help
 
            {[], [], []} ->
                :list_locations
            _ ->
                :invalid_arg
        end
    end

    def process(:help) do
        IO.puts """
        mines_sb_schedule              # List the schedule for the 2019 Mines Softball Team
        """
        System.halt(0)
    end

    def process(:list_locations) do
        Schedule.enter_schedule_flow()
    end

    def process(:invalid_arg) do
        IO.puts "Invalid argument(s) passed. See usage below:"
        process(:help)
    end

end    
