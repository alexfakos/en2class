# en2class
Teaching material for Estrategia II at ITAM

this is a simple example of

1)Calculating demand from a discrete choice model
2)Setting prices to maximize profits 
3)`Estimating' the price coefficient of demand from observed market shares prices, and known outside option utility


ISTRUCTIONS

got to juliabox.com
go to the console tab and execute the following
git clone https://github.com/alexfakos/en2class.git

go to the jupyter tab and then open the directory en2class/src

then got to the New tab and select: New>julia 0.4.6

go to the new notebook and type

include("rundir.jl")   then press Shift+Enter

rundir(4);              then press Shift+Enter to compile

(d,p)=rundir(400);      then press Shift+Enter to run the model

using PyPlot           then press Shift+Enter 

plot(d,p)               then press Shift+Enter to plot the demand curve
