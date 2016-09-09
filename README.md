# en2class
teaching material for Estrategia II at ITAM

Instructions
download the en2clas folder to your computer

got to juliabox.com
go to the console tab and execute the following
git clone https://github.com/alexfakos/en2class.git

go to the jupyter tab and then New>julia 0.4.6
go to the new notebook and type
;cd ~/en2class/src     then press Shift+Enter
using Distribution     then press Shift+Enter
include("demand.jl")   then press Shift+Enter
main(200,-.1,2,2);     then press Shift+Enter
you should be able to see 
Market Shares in %
Product 1:  46.5
Product 2:  38.0
Not buy  :  15.5
