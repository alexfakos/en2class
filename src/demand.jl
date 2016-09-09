#calculate demand functions from discrete choice model
function main(Nc,bp,p1,p2)
    srand(2) #set the seed
    const consepsil = rand(GeneralizedExtremeValue(0,1,0),2,Nc) #generate heterogeneity
    const consu1    = bp*p1 + consepsil[1,:] #consumers' utility for t
    const consu2    = bp*p2 + consepsil[2,:] #consumers' utility for t
    const u0        = zeros(1,Nc)
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
    println("Market Shares")
    println("Product 1:  ", round(shares[1]*1000) * 1e-1 )     
    println("Product 2:  ", round(shares[2]*1000) * 1e-1 )    
    println("Not buy  :  ", round(shares[3]*1000) * 1e-1 )    


    return (ncons,shares,choice)
end
