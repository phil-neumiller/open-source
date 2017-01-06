using JuMP, Cbc

# Define Model
m = Model(solver=CbcSolver())

# Declare Variables
@variable(m, x >= 0)
@variable(m, y >= 0)
@variable(m, 0 <= z <= 25)

# Set the objective
@objective(m, Min, 9x + 2y + 5z + 13)

# Adding Constraints
@constraint(m, constraint1, 5x + 3y -2z <= 30)
@constraint(m, constraint2, -7x - 4y - 3z <= -100)

# Show the Optimization Model
print(m)

# Solve LP Problem
solve(m)

# Printing the optimal solutions obtained
println("Optimal Solutions:")
println(" x = ", getvalue(x))
println(" y = ", getvalue(y))
println(" z = ", getvalue(z))
println("Dual Variables:")
println(" dual1 = ", getdual( constraint1))
println(" dual2 = ", getdual( constraint2))
