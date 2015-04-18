# This ia a comment
defmodule Circle do # Also this
  @moduledoc "Implements basic circle fucntions"
  @pi 3.141592

  @doc "Computes the area of the circle"
  @spec area(number) :: number
  def area(r), do: r*r*@pi

  @doc "Computes circumference of the circle"
  def circunference(r), do: 2*r*@pi
end
