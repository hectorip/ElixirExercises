defmodule MyBehaviour do

  @callback my_method_one :: boolean

end


defmodule MyMod do
  @behaviour MyBehaviour

  def my_method_one(), do: True
end
