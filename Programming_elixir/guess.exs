defmodule Guess do
  def guess(actual, range) do
    first..last = range
    my_guess = first + div(last, 2)
    compare(actual, my_guess, range)
  end

  def compare(actual, guessed, range) when actual == guessed do
    IO.puts guessed
  end
  def compare(actual, guessed, range) when actual > guessed do
    IO.puts "It's #{guessed}"
    _..last = range
    new_range = guessed..last
    guess(actual,new_range)
  end

  def compare(actual, guessed, range) when actual < guessed do
    IO.puts "It's #{guessed}"
    first.._ = range
    new_range = first..guessed
    guess(actual,new_range)
  end
end

