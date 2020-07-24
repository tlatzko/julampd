using Test
import julampd



function test_polyfit()
    
    x = zeros(1024)

    for i ∈ 1:1024
        x[i] = i * .1
    end
    p = [3, 2 , .2]
    y = julampd.polyval(p, x)
    phat = julampd.polyfit(x, y, 2)
    return p, phat

end
 


@testset "Julia AMPD Test" begin 
    p, phat = test_polyfit()
    @test julampd.detrend(10) == 20
    @test p ≈ phat
end;