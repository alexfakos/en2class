#script file to highlight consumer choice

Pkg.add("GSL")
#Pkg.add("PyPlot")
include("rundir.jl")
(d,p)=rundir(400)
#plot(d,p)

#=
bp= -.13888888
p1=2
p2=2
u0=0
Nc=6 #number of consumers
using Distributions
srand(2) #set the seed
consepsil = rand(GeneralizedExtremeValue(0,1,0),2,Nc) #generate heterogeneity for 5 consumers
consu1    = bp*p1 + consepsil[1,:] #consumers' utility for t
consu2    = bp*p2 + consepsil[2,:] #consumers' utility for t
u0        = fill(u0,(1,Nc))
println("Consumer utility for the 3 options")
println("Each column is a consumer")
println("Rows are product 1, product2, and outside option")
consuutil = [consu1; consu2; u0]
redisplay(consuutil)
choice    = zeros(Nc)
for i=1:Nc
    tmp=sortperm(consuutil[:,i])
    choice[i]=tmp[end]
end
redisplay("Product choice for each concumer")
redisplay(choice')
=#
