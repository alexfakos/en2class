# en2class
Teaching material for Estrategia II at ITAM

this is a simple example of

1)Calculating demand from a discrete choice model

2)Setting prices to maximize profits 

3)`Estimating' the price coefficient of demand from observed market shares, prices, and known outside option utility


INSTRUCTIONS

using your browser go to https://juliabox.com/ and sign in using your preferred method (via linked in, google, or github)

In the following instructions the command is in ' ' 

So when I tell you execute 'command' you have to type: command  and then press enter or shift+enter

===============================================================================

go to the console tab and type the following (if you want to paste the command, right click in the black space and choose: paste from browser):

'git clone https://github.com/alexfakos/en2class.git'  then press enter

go to the jupyter tab and then open the folder  en2class and then the folder src

go to the New tab (top right corner) and select: New>julia 0.4.6

go to the new notebook and type the following commands:

'include("rundir.jl")'    then press Shift+Enter

'rundir(4);'              then press Shift+Enter to compile

'(d,p)=rundir(400);'      then press Shift+Enter to run the model

'using PyPlot'            then press Shift+Enter 

'plot(d,p)'               then press Shift+Enter to plot the demand curve
