
# Attributes have the same value in code until another attribute sets 
# the value and all the functions after that has the new value
defmodule ExampleModule do
  @this_is_an_attribute "attr1"
  def func_1, do: IO.puts @this_is_an_attribute
  
  @this_is_an_attribute "attr2"
  def func_2, do: IO.puts @this_is_an_attribute

end