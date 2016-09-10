using Distributions
#using ASCIIPlots
include("demand.jl")
function rundir()
    N=200
    b=-.1
    price1=2
    price2=2
    outoption=0
    shares(N,b,price1,price2,outoption,1);
    
    (d,p)=calcdemand1(N,b,price2,outoption);
    #scatterplot(d,p,sym='*')
end


