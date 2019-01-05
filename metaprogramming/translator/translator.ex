defmodule Translator do
    defmacro __using__(_options) do
        quote do
            Module.register_attribute __MODULE__, :locales, accumulate: true, persist: false
            import unquote(__MODULE__), only: [locale: 2] # this imports Translator module
            @before_compile unquote(__MODULE__) # Tells the compile to compile Translator before the translations module
        end
    end

    defmacro __before_compile__(env) do
        compile(Module.get_attribute(env.Module, :locales))
    end

    defmacro locale(name, mappings) do
        quote bind_quoted: [name: name, mappings: mappings] do
            @locales {name, mappings}
        end
        def compile(translations) do
            translations_ast = for {locale, source} <- translations do
                deftranslations(locale, "", source)
            end

            quote do
                def t(locale, path, binding \\ [])
                # def t(_locale, _path, :)
            end
        end
    end
end