using Test

const binary = joinpath(dirname(@__DIR__), "build", "julia-format", "bin", "julia-format")
if !isfile(binary)
    error("These tests request the CLI app to be built.")
end

const expected = read("test_file_to_format_expected.jl", String)

@testset "JuliaFormatterCLI" begin
    @testset "format file" begin
        dir = mktempdir()
        f1 = joinpath(dir, "test_file_to_format.jl")
        cp("test_file_to_format.jl", f1)
        run(`$binary $f1`)
        @test read(f1, String) == expected
    end

    @testset "format two files" begin
        dir = mktempdir()
        f1 = joinpath(dir, "test_file_to_format.jl")
        f2 = joinpath(dir, "test_file_to_format2.jl")
        cp("test_file_to_format.jl", f1)
        cp("test_file_to_format.jl", f2)
        run(`$binary $f1 $f2`)
        @test read(f1, String) == expected
        @test read(f2, String) == expected
    end

    @testset "error flag" begin
        dir = mktempdir()
        f1 = joinpath(dir, "test_file_to_format.jl")
        cp("test_file_to_format.jl", f1)
        @test_throws ProcessFailedException run(`$binary --error $f1`)
        @test read(f1, String) == expected
    end
end
