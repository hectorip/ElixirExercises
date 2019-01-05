defmodule Translator do
    defmacro __using__(_options) do
        quote do
            Module.register_attribute __MODULE__, :locales, accumulate: true, persist: false
            import unquote(__MODULE__), only: [locale: 2] # this imports Translator module
            @before_compile unquote(__MODULE__) # Tells the compile to compile Translator before the translations module
        end
    end

    defmacro __before_compile__(env) do
        compile(Module.get_attribute(env.module, :locales))
    end

    defmacro locale(name, mappings) do
        quote bind_quoted: [name: name, mappings: mappings] do
            @locales {name, mappings}
        end
    end
    def compile(translations) do
        translations_ast = for {locale, source} <- translations do
            deftranslations(locale, "", source)
        end

        quote do
            def t(locale, path, binding \\ [])
            unquote(translations_ast)
            def t(_locale, _path, _bindings), do: {:error, :no_translation}
        end
    end

    def deftranslations(locale, current_path, translations) do
        for {k, v} <- translations do
            path = append_path(current_path, k)
            if Keyword.keyword?(v) do
                deftranslations(locale, path, v)
            else
                quote do
                    def t(unquote(locale), unquote(path), bindings) do
                        unquote(interpolate(v))
                    end
                end
            end
        end
    end

    def interpolate(val) do
        ~r/(?<head>)%{[^}]+}(?<tail>)/
        |> Regex.split(val, on: [:head, :tail])
        |> Enum.reduce "", fn
            <<"%{" <> rest >>, acc ->
                key = String.to_atom(String.rstrip(rest, ?}))
                quote do
                    unquote(acc) <> to_string(Dict.fetch!(bindings, unquote(key)))
                end
            segment, acc -> quote do
                unquote(acc) <> unquote(segment)
            end
        end
    end

    defp append_path("", next), do: to_string(next)
    defp append_path(current, next), do: "#{current}.#{next}"
end

defmodule EmojiTranslate do
    use Translator

    locale "emoji",
    flash: [
        holi: "👋 Holi %{name}",
        please: "🙏"
    ]

    locale "mexican",
    flash: [
        holi: "Que ondi, %{name}",
        please: "Porfi, carnal"
    ]
end