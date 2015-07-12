# Binaries

bin = << 1, 2>>
byte_size bin

# You can also set size of each field
bin_sizes = <<3 :: size(2), 5 :: size(4), 1 :: size(2)>>

IO.puts(byte_size bin_sizes)

