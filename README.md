# en2class
## Teaching material for Estrategia II at ITAM

This is a simple example of

1. Calculating demand from a discrete choice model

2. Setting prices to maximize profits 

3. "Estimating" the price coefficient of demand from observed market shares, prices, and known outside option utility by inverting the market share equations.

**Note**: The model ignores the supply side of the market and the endogeneity of the errors in order to focus on the demand side and give an intuitive idea of the inverse problem of estimating demand parameters. For more information on demand estimation see Berry(1994, Rand) and Berry, Levinsohn, and Pakes(1995, Econometrica), Nevo(2001, Econometrica), Ackerberg, Benkard, Berry, Pakes(2007, Handbook of Econometrics) and the references therein.   

The code is writen in [Julia](http://julialang.org/) which is a free programming language for scientific computing. The code is writen to be intuitive and readable by humars. The code is not optimized for performance, uses brute force grid search for optimization and equation solving, and thus can be a little slow. The grid search algorithm serves to highlight the simple structure of the problems. 

## Instructions

Using your browser go to [juliabox](https://juliabox.com/) and sign in using your preferred method (via linkedin, google, or github)

In the following instructions the command is in `command` 

So when I tell you execute `command` you have to type: command and then press **Enter** or **Shift+Enter**

go to the console tab and type the following (if you want to paste the command, right click in the black space and choose: paste from browser):

`git clone https://github.com/alexfakos/en2class.git`  then press **Enter**

go to the jupyter tab and then open the folder  **en2class** and then the folder **src**

go to the New tab (top right corner) and select: New>julia 0.4.6

go to the new notebook and type the following commands:

```julia
include("rundir.jl")
``` 
then press **Shift+Enter**

```julia 
rundir(4);
``` 
then press **Shift+Enter** to compile

```julia
(d,p)=rundir(400);
```
then press **Shift+Enter** to run the model for 400 consumers

```julia
using PyPlot
```
then press **Shift+Enter** 

```julia
plot(d,p)
```
then press **Shift+Enter** to plot the demand curve for product 1 for a given price of product 2
