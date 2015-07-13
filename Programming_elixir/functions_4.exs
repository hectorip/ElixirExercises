prefix = fn pref ->
  fn word ->
    IO.puts(pref <> " " <> word)
  end
end

mrs = prefix.("Mrs.")
mrs.("Tesla")

prefix.("C.").("Kane")