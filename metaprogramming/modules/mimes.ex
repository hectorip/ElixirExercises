defmodule Mimetypes do
    for line <- File.stream!(Path.join([__DIR__], "mimetypes.txt"), [], :line) do
        [type, extensions] = line
            |> String.split("\t")
            |> Enum.map(&String.strip(&1))
    end
end