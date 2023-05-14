module TestPrimaryRegulation

using Test
import PowerSystemsControl

function test_freq_and_interconnection_variation()
    delta_expected = [-0.04838709677419355,
        -103.22580645161288,
        159.67741935483875,
        -56.45161290322581
    ]

    freq_coef = [2000, 3300, 900]
    demand_variation = [200, 0, 100]
    delta_calculated = PowerSystemsControl.get_frequency_and_interconnection_variations(freq_coef, demand_variation)

    @test delta_calculated == delta_expected
end

function runtests()
    for name in names(@__MODULE__; all = true)
        if startswith("$name", "test_")
            @testset "$(name)" begin
                getfield(@__MODULE__, name)()
            end
        end
    end
end

TestPrimaryRegulation.runtests()

end # module
