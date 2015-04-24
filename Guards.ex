defmodule TestNum do
  
  def test(x) when x < 0 do
    :negative
  end

  def test(0) do
    :zero
  end

  def test(x) when x > 0 do
    :postive
  end

end
