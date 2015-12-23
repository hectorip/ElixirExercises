{:module, _, binary, _} = contents
# The equals symbol is called pattern matching, is not an assign
:rpc.call :"node_two@MacBook-Pro-de-HectorIP", :code, :load_binary, [Hello, 'iex', binary]
