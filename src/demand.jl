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
    ncons=zeros(3)
    ncons[1]=sum(choice.==1)
    ncons[2]=sum(choice.==2)
    ncons[3]=sum(choice.==3)
    shares  =ncons./Nc
    if prnt == 1
        println("Market Shares in \%")
        @printf "Product 1:  %2.1f\n"  round(shares[1]*1000) /10     
        @printf "Product 2:  %2.1f\n"  round(shares[2]*1000) /10     
        @printf "Not buy  :  %2.1f\n"  round(shares[3]*1000) /10  
    end
    return (ncons,shares,choice)
end



function calcdemand1(Nc,bp,p2,u0)
    srand(2)
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



        

