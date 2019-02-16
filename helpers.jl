#=
helpers:
- Julia version: 1.0.3
- Author: brian
- Date: 2019-02-14
=#

using Plots
using Polynomials

# define a recipe for plotting polynomials
# https://github.com/JuliaPlots/ExamplePlots.jl/blob/master/notebooks/usertype_recipes.ipynb
@recipe function plot(p::Poly{Int64}, n::Integer = 100)
    c = roots(p)
    span = (maximum(c) - minimum(c))/5
    (p, range(minimum(c) - span, stop=maximum(c) + span, length=n))
end

@recipe function plot(p::Poly{Int64}, x::AbstractArray{Float64,1}) where T
    y = map(p, x)
    seriestype --> :path
    title --> repr("text/plain", p)
    x, y
end

# Display the polynomial nicely
exponent_text(i, ::MIME) = "^$(i)"
exponent_text(i, ::MIME"text/html") = "<sup>$(i)</sup>"
exponent_text(i, ::MIME"text/latex") = "^{$(i)}"

using Polynomials

function Polynomials.printexponent(io, var, i, mimetype::MIME)
    if i == 0
        return
    elseif i == 1
        print(io, var)
    else
        print(io, var, exponent_text(i, mimetype))
    end
end




        