defmodule Html do
    defmacro html(do: block) do
        quote do
            # declare and init Agent
            {:ok, var!(buffer, Html)} = start_buffer([])
            unquote(block)
            result = render(var!(buffer, Html))
            :ok = stop_buffer(var!(buffer, Html))
            result
        end
    end
    def start_buffer(initial_state) do
        Agent.start_link(fn -> initial_state end)
    end
    def stop_buffer(pid) do
        Agent.stop(pid)
    end
    def save(buff, data) do
        buff |> Agent.update(&([data | &1]))
    end
    def render(buffer) do
        # Tags were introduced pushing down older ones
        Agent.get(buffer, fn data -> data |> Enum.reverse |> Enum.join("") end)
    end
    defmacro tag(tag_name, do: block) do
        quote do
            save(var!(buffer, Html),"<#{Atom.to_string(unquote(tag_name))}>")
            unquote(block)
            save(var!(buffer, Html),"</#{Atom.to_string(unquote(tag_name))}>")
        end
    end

    defmacro text(content) do
        quote do
            save(var!(buffer, Html), "#{unquote(content)}")
        end
    end
end

defmodule HtmlTest do
    import Html
    def simplePage(name) do
        html do
            tag :p do
                text name
            end
        end
    end

    def table(rows) do
        html do
            tag :h1 do
                text "This is a table"
            end
            tag :div do
                tag :table do
                    for row <- 1..rows do
                        tag :tr do
                            tag :td do
                                text "Row number #{row}"
                            end
                        end
                    end
                end
            end
            tag :p do
                text "Final P"
            end
        end
    end
end