# Stepper_Motor :cd:
## Table Of Contents
 * [Stepper motor working princible](#desc)
 + [Components](#comp)
 - [Code Explanation](#code)
    1. Modes
       * [Half mode](#half) 
       * [Full mode](#full)  
    2. Directions      
       * Clock-Wise
       * Anti Cloc-Wise
    3. Speed      
       * Normal
       * Intermediate
       * Fast
       
<a name="desc"></a>
## Stepper motor working princible
> write a line next to each arrow an if u need more line add more arrows
> 
> bluh
> 
> 
> bluh bluh
> 
>    


<a name="comp"></a>
## Components
> ### Circuit Design
> 
> ![](GIFS/circuitDiagram.PNG)
> ### 1- 8086 µp
> > so after all 8086 µp is only the CPU of our program -processes and  executes our assembly code- so it needs to be connected to a 
> > storage device and an I/O device, here comes the rule of …
> ### 2- latch : 74HC373 
> >  is an octal D-type transparent latch , works as storage device, holds data through feedback lane
> >
> ### 3- I/O device : 8255A  
> >  intel general purpose programmable  I/O device, used in 2 modes either i/o mode or BSR mode, in out project it’s used  in i/O mode.
> >   - It has 3-ports are used as i/o ,(PortA,PortB,PortC).
> >   - PORTC is consist of PC Lower, PC Upper.
> >   - There are different modes ,we use mode 0.
> >   - So,let D6=0 , D5=0 ,D2=0.
> >   - To use as i/o mode ,let D7=1.
> > 
> ### 4- motor driver:  ULN2003A   
> > is a type of motor driver used to amplify the current produced by our circuit to suit the current needed by the stepper 
> >
> ### 5- stepper motor
> ### 6- battary 12V
> ### 7- logicstates

 
 <a name="code"></a>
## Code Explanation
# we have in our code 11 Procedures.
 - MODE PROC
   > Determine whice mode is choosed by user by:
   Get input from portc by logic gates (0 or 1 )
   - PC0 =1   go to full mode.
   - PC0 =0   go to half mode.
   Call in the start of code.
- PRESS PROC
   > Check if user change mode,or direction ,or speed by:
   Compare the Present value of portc by the provious value of portc.
   Call after ever steps in half or full mode.
- FULLCW
- FULLACW
- HALFCW
- HALFACW
   - This 4 procedures have code of every mode (steps that motor do).
     > Port A is get its value for every revolution from this procedure.
     Is Determined after call MODE PROC by check PC1. 
    - PC1 =0         go to clock wise 
    - PC1 =1         go to anti clock wise 

- DELAY PROC
   > In our project ,we control speed by using different delays after every revolution.
   We have 3 speeds low , intermediate , high.
   Every speed has its own delay.
    - Delay low >> delay intermediate >> delay high
   Is determined by check PC2 , PC3  , PC4
    - PC2  =1    speed is low.
    - PC3  =1    speed is intermediate.
    - PC3  =1    speed is high.
    - If  PC2  =0   &&  PC3  =0   &&  PC4  =0   
       > Motor will stop.

- NORMP PROC
- MIDP PROC
- FASTP PROC
  > This 3 procedure have code whice control delay for every speed.
- STOPP PROC
> This proc let portA take 00H as o/p to let motor stop working.
 
  <a name="half"></a>
### Half Mode
  
  > write a line next to each arrow an if u need more line add more arrows
> 
> bluh

  
~~~markdown
# Half Clock-Wise
# intermediate speed
 
~~~
```javascript
HALFCW PROC
  HALFCW ENDP
   ```
  
 put the Gif
 
 
  
~~~markdown
# Half Anti Clock-Wise
# fast speed
 
~~~
```javascript
HALFACW PROC
  HALFACW ENDP
   ```

 put the Gif

 
  <a name="full"></a>
### FULL Mode
> write a line next to each arrow an if u need more line add more arrows
> 
> bluh
> 

  
~~~markdown
# FULL Clock-Wise
# fast speed


~~~
```javascript
FULLCW PROC
  FULLCW ENDP
   ```
   put the Gif
 
 
  
~~~markdown
# FULL Anti Clock-Wise
# intermediate speed



~~~
```javascript
FULLACW PROC
  FULLACW ENDP
   ```
   put the Gif
 
 
