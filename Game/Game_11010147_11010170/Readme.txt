################################################
Roll Nos. : 11010147 and 11010170
Names : Nishant Yadav and Vishal Anand
Date : 31/10/2014
################################################


How To run the code ?
	- Step 1 : Double click on the file 'FinalGame_11010147_11010170.hs'.
	- Step 2 : Type 'main' in the command prompt and press enter
	The game starts now just follow the instructions given in the game, the game has 2 modes namely, 'player vs player' and
'player vs computer', you can select the mode and also the map (stage) you want to play . So, just enjoy the game :)

Data structure used for representing the tree is described as follows:
	We have used a list of lists containing integers for representing the tree , where each internal list inside the outer list
represents a branch of the tree and the first element in the internal list has one of the three values 0,1 or 2 representing color of
the branch as common color, player 1's color or player 2's color resp. , the rest of the integers in the list represent the id's of all
the branches that will be removed when the given branch is cut. Id of a branch is it's position in the list starting from 0.
      Now we will explain how to convert a game tree into the representation that we have used with an example:
		
		Tree :
					|b  |r                  | b
					|3  |4                  |7
					r\  /b			\g
					 1\/2                    \6
					   |g                     |r
					   |0                     |5

				Where b = "Blue"  (Common Color)
				      r = "Red"   (Player 1's color)
				      g = "Green" (Player 2's color)	
				   and the numbers are the id's assigned to the branches starting from 0 (There isn't a particular way
						to assign the id's but always start the id number from 0 and go on to assign id's
						as 1,2,... ,i.e, continous nos.)

Follow the following steps to convert the given tree into an representation used by the code :
			- Step 1 : make a list for every branch where the first element in the list is the branch color and the rest
				   of the elements are the branch id's of the branches that will be removed when the concerned branch
				   is cut , e.g. : for branch with id 0 : [g,1,2,3,4]
			- Step 2 : Now put all the lists made in previous step inside another list by ordering them according to their
				   respective branch id's , i.e. , list of branch id 0 must be the first in the new list followed by
				   list of branch id 1 and so on. Thus, the following list is obtained:
				[[g,1,2,3,4],[r,3],[b,4],[b],[r],[r,6,7],[g,7],[b]]
	 		- Step 3 : replace b with 0, r with 1 and g with 2 . The following list is obtained:
				[[2,1,2,3,4],[1,3],[0,4],[0],[1],[1,6,7],[2,7],[0]]

In this way, the final list obtained at the end of step 3 is the desired list that can be used in the code to represent the given tree.

Adding user defined trees :
	To add user defined trees in the game just convert the desired tree into the representation used by the code as explained above.
After obtaining the list follow the following step:
	- Step 1 : open 'Maps.hs' in a text editor
	- Step 2 : add this line just before the variable 'maps' used after the where clause:
			<variable name not used before> = obtained list , e.g.:
				t4 = [[2,1,2,3,4],[1,3],[0,4],[0],[1],[1,6,7],[2,7],[0]]
	- Step 3 : Add the variable name given by you (e.g. t4) in the list of maps at the position that you want as the stage no.
		   in the game for your tree.
	- Step 4 : Save 'Maps.hs'
