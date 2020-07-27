module julampd

using LinearAlgebra


function polyfit(x::AbstractArray{<:Number, 1}, y::AbstractArray{<:Number, 1}, degree=1)
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

function polyval(p::AbstractArray{<:Number, 1}, x::AbstractArray{<:Number, 1})
    # this will be replaced with horners method  ..later on 
    y = fill(p[1], size(x))
    for i ∈ 2:length(p)
        y = (x .* y) .+ p[i]
    end
    return y
end


function  detrend(y::AbstractArray{<:Number, 1}, degree=1)
    x = 1:length(y)
    p = polyfit(x, y, degree)
    yhat = polyval(p, x)
    yflat = y .- yhat
    return yflat
end


function find_peak(x::AbstractArray{<:Number, 1}, scale=nothing)
    xd = detrend(x)
    N = length(xd)
    L = Int(N / 2)
    if scale != nothing
        L = min(scale, L)
    end
    LSM = zeros(Bool, L, N)

    for k ∈ 1:L
        LSM[k, k:(N - k + 1)] =(xd[1:(N - 2 * (k - 1))] .< xd[k:(N - k + 1)]) .& (xd[k:(N - k + 1)] .> xd[(2k - 1):N])
    end
    G = sum(transpose(LSM), dims=1)
    t = sum(transpose(LSM), dims=1)

    l_scale = argmax(G)

    pks_logical = transpose(minimum(LSM[2:l_scale[2], :], dims=1))
    pks = [i for i ∈ 1:length(pks_logical) if pks_logical[i] > 0]
    return pks

end

greet() = print("Hello World!")

function detrend(x)
    return x * 2
end

end # module