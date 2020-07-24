using Test
import julampd



function test_polyfit()
    
    x = zeros(1024)

    for i ∈ 1:1024
        x[i] = i * .1
    end
    p = [3, 2 , .2]
    y = p[1] .* x.^2 + p[2] .* x  .+ p[3] 

end


@testset "Julia AMPD Test" begin 
    @test julampd.detrend(10) == 20
end;