import JuliaFormatterCLI
dir = mktempdir()
path = joinpath(dir, "test_file_to_format.jl")
cp(joinpath(dirname(@__DIR__), "test", "test_file_to_format.jl"), path)
JuliaFormatterCLI.format(path)
