defmodule Html do
    defmacro html do
        # declare and init Agent
        # render result

    end

    defmacro tag do
        
    end

    defmacro text do
        
    end
end

defmodule HtmlTest do
    def simplePage(name) do
        html do
            tag :p, do
                text name
            end
        end
    end
end