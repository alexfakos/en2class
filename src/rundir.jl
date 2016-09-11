using Distributions
#using ASCIIPlots
include("demand.jl")
#@debug function rundir()
function rundir(N)
    #N=400
    b= -.13888888
    price1=2
    price2=2
    outoption=0
    #@bp
    (aux1,shrs,aux2)=shares(N,b,price1,price2,outoption,1);
    
    (d,p)=calcdemand1(N,b,price2,outoption);
    #scatterplot(d,p,sym='*')

    (bopt,diff) = invertdemand(shrs[1],shrs[2],shrs[3],price1,price2,outoption,N)
end


