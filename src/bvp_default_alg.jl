function default_algorithm(prob::DiffEqBase.AbstractBVProblem; kwargs...)
    o = Dict{Symbol, Any}(kwargs)
    extra_kwargs = Any[]
    alg = Shooting(Tsit5()) # Standard default
    uEltype = eltype(prob.u0)

    alg_hints = get_alg_hints(o)

    # If adaptivity is not set and the tType is not a float, turn off adaptivity
    # Bad interaction with ForwardDiff
    #!(tType <: AbstractFloat) && (:adaptive ∉ keys(o)) && push!(extra_kwargs,:adaptive=>false)

    alg, extra_kwargs
end
