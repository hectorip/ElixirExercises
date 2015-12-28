defmodule ImportExample do:
  import List

  def f1 do
     List.flatten [1,[1,2],4]
  end

  def f2 do
    # Once you have imported a module, you have all the functions it has
    # available to your use
    flatten [1,[3,5],[7,8]]
  end

  def f3 do
    import List, only: [flatten: 1]
    flatten [5,[6,7],[6,9]]
  end
end