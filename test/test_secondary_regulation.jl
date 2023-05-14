module TestSecondaryRegulation

using Test
import PowerSystemsControl

function test_ace()
    ace_expected =  [-199.99999999999997,
        2.842170943040401e-14,
        -100.0
    ]

    freq_coef = [2000, 3300, 900]
    demand_variation = [200, 0, 100]
    bias = freq_coef
    ace_calculated = PowerSystemsControl.get_ace(bias, freq_coef, demand_variation)

    @test round.(ace_expected) == round.(ace_calculated)
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

TestSecondaryRegulation.runtests()

end # module
