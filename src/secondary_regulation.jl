function get_ace(
    bias::Union{Vector{Float64}, Vector{Int}},
    frequency_coefficient::Union{Vector{Float64}, Vector{Int}},
    demand_variation::Union{Vector{Float64}, Vector{Int}},
)
    number_of_areas = length(bias)
    id = Matrix(I, number_of_areas, number_of_areas)

    A = hcat(bias, id)
    x = get_frequency_and_interconnection_variations(frequency_coefficient, demand_variation)

    return A*x
end