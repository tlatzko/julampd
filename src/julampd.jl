module julampd

using LinearAlgebra


function polyfit(x::Array{<:Number, 1}, y::Array{<:Number, 1}, degree=1)
    X = ones(length(x), degree + 1)
    for j ∈ 1:length(x)
        for i ∈ 1:(degree)
            X[j, i] = x[j]^(degree - (i - 1)) 
        end
    end

    ixx = pinv(transpose(X) * X)
    B = ixx * transpose(X) * y

    return B
end

function polyval(p, x)
    # this will be replaced with horners method  ..later on 
    y = fill(p[1], size(x))
    for i ∈ 2:length(p)
        y = (x .* y) .+ p[i]
    end
    return y
end


function  detrend(x::Array{<:Number, 1}, y::Array{<:Number, 1}, degree=1)
    p = polyfit(x, y, degree)

    
end

greet() = print("Hello World!")

function detrend(x)
    return x * 2
end

end # module