# Summary statistics
summary_stats = summarystats(chain)
display(summary_stats)

# Extract samples for further analysis
samples = Array(chain)
t0_samples = samples[:, 1]
rp_samples = samples[:, 2]
b_samples = samples[:, 3]

# Plot joint posterior distributions
scatter(rp_samples, b_samples, alpha=0.3,
    xlabel="Planet-to-star radius ratio (rp)",
    ylabel="Impact parameter (b)",
    title="Joint posterior distribution")

# Calculate the MAP (maximum a posteriori) estimates
map_idx = argmax(chain[:lp])
t0_map = t0_samples[map_idx]
rp_map = rp_samples[map_idx]
b_map = b_samples[map_idx]

# Mark the MAP estimate on the joint posterior plot
scatter!([rp_map], [b_map], color=:red, markersize=10, label="MAP")

# Plot the best-fit model
best_params = TransitParams(;
    t0=t0_map,
    per=3.0,
    rp=rp_map,
    a=15.0,
    inc=acosd(b_map / 15.0),
    u=[0.3, 0.3]
)
best_model = light_curve(best_params, data.time)

# Plot data with best-fit model
p = scatter(data.time, data.flux,
    label="Data",
    xlabel="Time (days)",
    ylabel="Relative flux",
    title="Transit light curve with best-fit model")
plot!(p, data.time, best_model, linewidth=2, label="Best-fit model")

# Convergence diagnostics
gelmandiag = gelmandiag(chain)
display(gelmandiag)

# Autocorrelation plots
autocorplot(chain)

# Effective sample size
ess = ess_rhat(chain)
display(ess)

# Print the parameter estimates with uncertainties
println("Parameter estimates with uncertainties:")
println("Transit time (t0) = $(round(mean(t0_samples), digits=6)) ± $(round(std(t0_samples), digits=6)) days")
println("Planet-to-star radius ratio (rp) = $(round(mean(rp_samples), digits=6)) ± $(round(std(rp_samples), digits=6))")
println("Impact parameter (b) = $(round(mean(b_samples), digits=6)) ± $(round(std(b_samples), digits=6))")

# Calculate 95% credible intervals
t0_interval = quantile(t0_samples, [0.025, 0.975])
rp_interval = quantile(rp_samples, [0.025, 0.975])
b_interval = quantile(b_samples, [0.025, 0.975])

println("95% credible intervals:")
println("Transit time (t0): ($(round(t0_interval[1], digits=6)), $(round(t0_interval[2], digits=6)))")
println("Planet-to-star radius ratio (rp): ($(round(rp_interval[1], digits=6)), $(round(rp_interval[2], digits=6)))")
println("Impact parameter (b): ($(round(b_interval[1], digits=6)), $(round(b_interval[2], digits=6)))")
