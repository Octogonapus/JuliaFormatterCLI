import JuliaFormatterCLI
JuliaFormatterCLI.format(joinpath(dirname(@__DIR__), "test", "test_file_to_format.jl"), no_overwrite=true)
