import JuliaFormatterCLI, Downloads, Tar, CodecZlib

const bundle_tar_path = joinpath(@__DIR__, "file-bundle.zip")
const bundle_path = joinpath(@__DIR__, "file-bundle")
rm(bundle_path; force=true, recursive=true)
mkpath(bundle_path)

Downloads.download(
    "https://github.com/domluna/JuliaFormatter.jl/archive/refs/tags/v1.0.9.tar.gz",
    bundle_tar_path,
)

bundle_tar_gz = open(bundle_tar_path)
bundle_tar = CodecZlib.GzipDecompressorStream(bundle_tar_gz)
try
    Tar.extract(bundle_tar, bundle_path)
finally
    close(bundle_tar)
end

JuliaFormatterCLI.comonicon_install()
