#calculate demand functions from discrete choice model
function shares(Nc,bp,p1,p2,u0,prnt)
    srand(2) #set the seed
    const consepsil = rand(GeneralizedExtremeValue(0,1,0),2,Nc) #generate heterogeneity
    const consu1    = bp*p1 + consepsil[1,:] #consumers' utility for t
    const consu2    = bp*p2 + consepsil[2,:] #consumers' utility for t
          u0        = fill(u0,(1,Nc))
    consuopt        = [consu1; consu2; u0]
    choice          = zeros(Nc)
    for i=1:Nc
        tmp=sortperm(consuopt[:,i])
        choice[i]=tmp[end]
    end
    if prnt == 1
        println("The price coefficient, b is: ",bp)
    end
    ncons=zeros(3)
    ncons[1]=sum(choice.==1)
    ncons[2]=sum(choice.==2)
    ncons[3]=sum(choice.==3)
    shares  =ncons./Nc
    if prnt == 1
        println("Market Shares in \%")
        @printf "Product 1:  %2.3f\n"  shares[1]*100     
        @printf "Product 2:  %2.3f\n"  shares[2]*100     
        @printf "Not buy  :  %2.3f\n"  shares[3]*100  
    end
    return (ncons,shares,choice)
end



function calcdemand1(Nc,bp,p2,u0)
    p=0.0
    step=0.1
    (n,b,c)=shares(Nc,bp,p,p2,u0,0)
    D=n[1]
    for i=2:1e5
        if D[1]>1e-3
            p=[p[1]+step; p]
            (n,b,c)=shares(Nc,bp,p[1],p2,u0,0);
            D=[n[1]; D]
            #println("p=",p[1])
            #println("D=",D[1])
        else
            break
        end
    end
    return (D,p)
end

function invertdemand(sh1,sh2,sh3,p1,p2,u0,Nc)
    b=0.0
    bopt=copy(b)
    step= 0.05
    (n,sh,c)=shares(Nc,b,p1,p2,u0,0)
    diff=norm( [ sh[1]-sh1; sh[2]-sh2 ])
    diffopt = copy(diff)
    for i=1:1e5
        if diff>1e-4
            b=b-step
            (n,sh,c)=shares(Nc,b,p1,p2,u0,0)
            diff=norm( [ sh[1]-sh1; sh[2]-sh2 ])
            if diff<diffopt
                diffopt= diff
                bopt=b
            end
        else
            break
        end
    end
    #println("Estimated b is: ", bopt)
    println("Estimated shares and price coefficient")
    shares(Nc,bopt,p1,p2,u0,1)
    return (bopt,diff)
end


function maximizeprofits(Demand,price,mc)
    profits=Demand[1]*(price[1]-mc)
    optprofits=copy(profits)
    optindex=1
    for i=2:length(Demand)
        profits=Demand[i]*(price[i]-mc)
        if profits>optprofits
            optprofits=profits
            optindex=i
        end
    end
    println("Profit maximizing price is: ", price[optindex])
    println("Marginal cost is: ", mc)
    println("Profit maximizing number of customers is: ", Demand[optindex])
    println("Profit maximizing sales are: ", Demand[optindex]*price[optindex])
    println("Maximum variable profits are: ", optprofits)
end





        

