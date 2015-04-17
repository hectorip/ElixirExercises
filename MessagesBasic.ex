defmodule Spawn1 do
    def greet do
        receive do
            {sender, msg} -> send sender, {:ok, "Hallo, #{msg}"}
        end
    end
end
