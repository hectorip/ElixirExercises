Node.connect("mynosq@mymachine")
:erlang.register_name(:node_two, :erlang.group_leader)
IO.puts(group_leader, "message")
