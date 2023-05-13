function get_frequency_and_transmission_variations(
    natural_characteristic::Union{Vector{Float64}, Vector{Int}},
    demand_variation::Union{Vector{Float64}, Vector{Int}},
)
    number_of_areas = length(natural_characteristic)
    id = Matrix(I, number_of_areas, number_of_areas)
    last_row = vcat(0.0, ones(number_of_areas))

    A = hcat(natural_characteristic, id)
    A = vcat(A, last_row')
    b = vcat(-demand_variation, 0.0)

    return (A^-1)*(b)
end