
# Battleblog!

The main point for me of writing this project is for me to re-introduce myself to concepts I learned in Dev Bootcamp in the summer and fall of 2016, to take initially simple concepts and add layers of complexity, and to practice writing changeable code with good object oriented design. Much of my design approach was inspired by [Practical Object Oriented Design in Ruby](http://www.poodr.com) by [Sandi Metz](https://www.sandimetz.com). 

I found it was very interesting that I could go back to concepts I feel like I've attained some level of mastery over -- such as introductory Ruby programming techniques that we learned in "Phase 1" of Dev Bootcamp -- and find new depth and understanding. 

It reinforces a lesson that I started learning at DBC: you always have more to learn. Even when you think you know it. Perhaps especially then. 

It's fun to draw together ideas from different places through out my learning journey and combine them in a way that I wouldn't have thought of the last time I went over this material. 


## Thoughts I had while coding

- I've been reading POODR, and I'm thinking I should take another look at how my classes are interacting with each other, and see if there are too many references from outside of the class that depend on the data structure inside a class. For example, maybe I should wrap the access to board positions inside a method, so I can say "give me a random cell" or "give me the cells that this boat occupies" 


- I decided to change the way I referred to coordinates internally to the board -- moving to two arrays vs. two hashes with number keys and symbol keys -- and I only had to change code in one spot (the method that generates the blank board). I also had to change the method to see if the boat will fit in the current spot based on the starting position and direction and length, but the change of coordinates allowed me to simplify the fit check method. I think I succeeded at 'easy to change'!



