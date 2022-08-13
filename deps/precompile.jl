import JuliaFormatterCLI
const bundle_path = mkpath(joinpath(@__DIR__, "file-bundle"))
const dir = mktempdir()
cp(bundle_path, dir; force=true)
JuliaFormatterCLI.format(dir)
