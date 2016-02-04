# how to get random numbers in Elixir

# first we need to seed the pseudo-random number generator.
# We are using the current timestamp as a unique number because it
# can be considered as unique number in an application that has only one
# process, if we have more processes, in order to avoid number
# repetition, we need to look for another unique number to seed.

:random.seed(:os.timestamp)


# now, we can ask for a random number, this will return a random number between
# 0 and 1

:random.uniform
