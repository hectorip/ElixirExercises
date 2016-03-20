# Behaviours are like interfaces in OOP Languages, 
# they define interfaces, they define the public 'behaviour'

defmodule MyBehaviour do

  @callback my_method_one :: boolean

end


defmodule MyMod do
  @behaviour MyBehaviour

  def my_method_one(), do: True
end
