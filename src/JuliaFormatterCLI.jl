module JuliaFormatterCLI

using Comonicon
import JuliaFormatter

"""
Format the given files.

# Args

- `paths`: a path or paths to format

# Flags

- `--markdown`: format Markdown files.
- `--error`: return a nonzero exit code if the paths were not already formatted.
- `-v, --verbose`: verbose mode.

"""
@main function format(paths...; markdown::Bool=false, error::Bool=false, verbose::Bool=false)
    already_formatted = JuliaFormatter.format(
        paths;
        overwrite=true,
        verbose=verbose,
        format_markdown=markdown
    )
    if !already_formatted && error
        exit(1)
    end
end

end # module
