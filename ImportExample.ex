defmodule ImportExample do:
  # Import a module is not necesary to use its functions you could use
  # them by calling the complete name like `List.flatten` but if you import
  # the module you can use it without the module name, like `flatten`
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