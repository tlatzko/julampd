## imports
import julampd
julampd.greet()
## for the stuff
function compute_avg(x, y)
    return (x + y) / 2
end
a = 18
b = 20
c = compute_avg(a, b)
print("test")

## halle 
using Plots

@userplot CirclePlot
@recipe function f(cp::CirclePlot)
    x, y, i = cp.args
    n = length(x)
    inds = circshift(1:n, 1 - i)
    linewidth --> range(0, 10, length = n)
    seriesalpha --> range(0, 1, length = n)
    aspect_ratio --> 1
    label --> false
    x[inds], y[inds]
end

n = 150
t = range(0, 2π, length = n)
x = sin.(t)
y = cos.(t)

## run gif
@gif for i ∈ 1:n
circleplot(x, y, 1)
end

##
plot(x, y)