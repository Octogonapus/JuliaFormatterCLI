module JuliaFormatterCLI

using Comonicon
import JuliaFormatter

"""
sum two numbers.

# Args

- `x`: first number
- `y`: second number

# Options

- `-p, --precision=<type>`: precision of the calculation.

# Flags

- `-f, --fastmath`: enable fastmath.

"""
@cast function format(paths; format_markdown=false, no_overwrite=false, no_error=false, verbose=false)
    already_formatted = JuliaFormatter.format(
        paths;
        overwrite=!no_overwrite,
        verbose=verbose,
        format_markdown=format_markdown
    )
    return already_formatted || no_error
end

"""
my demo Comonicon CLI project.
"""
@main

end # module
